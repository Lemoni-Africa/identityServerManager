using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using OnePaySystem.Models.DTOs.Requests;
using OnePaySystem.Models.DTOs.Responses;
using Newtonsoft.Json;
using NLog;
using OnePaySystem.DataAccess.Repository.IRepository;

namespace OnePaySystem.IdentityServer.Controllers
{
    [Route("api/v1/")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        private readonly IAPIAuthRepository _authRepository;
        private readonly ILogger<ClientController> _logger;

        public ClientController(IAPIAuthRepository authRepository, ILogger<ClientController> logger)
        {
            _authRepository = authRepository;
            _logger = logger;
        }

        [HttpGet]
        [Route("api-scopes")]
        public async Task<IActionResult> GeApiScopes()
        {
            var scopes = await _authRepository.GetScopes();
            return Ok(new
            {
                IssucessFul = true,
                Scopes = scopes
            });
        }

        [HttpPost]
        [Route("roles/api-resource")]
        [AllowAnonymous]
        public async Task<IActionResult> CreateApiResource(CreateNewResourceDto request)
        {
            var response = new DefaultResponse();
            try
            {
                await _authRepository.CreateResource(request);
                response.ResponseMessage = "API Resource Created Successfully!!!";
                response.ResponseCode = "000";
                response.IsSuccessful = true;
                return StatusCode(201,response);
            }
            catch (Exception e)
            {
                response.ResponseMessage = e.Message;
                response.ResponseCode = "911";
                _logger.LogError($"API Scope Creation Error {JsonConvert.SerializeObject(e)}");
                return StatusCode(500, response);
            }

        }

        [HttpPost]
        [Route("roles/api-scope")]
        [AllowAnonymous]
        public async Task<IActionResult> CreateApiScope(CreateNewScopeDto request)
        {
            var response = new DefaultResponse();
            try
            {
                await _authRepository.CreateScope(request);
                response.ResponseMessage = "API Scope Created Successfully";
                response.ResponseCode = "000";
                response.IsSuccessful = true;
                return StatusCode(201, response);
            }
            catch (Exception e)
            {
                response.ResponseMessage = e.Message;
                response.ResponseCode = "911";
                _logger.LogError($"API Scope Creation Error {JsonConvert.SerializeObject(e)}");
                return StatusCode(500, response);
            }

        }

        [HttpDelete]
        [Route("roles/api-scope/{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> DeleteApiScope(int id)
        {
            var response = new DefaultResponse();
            try
            {
                await _authRepository.DeleteApiScope(id);
                response.ResponseMessage = "API Scope Delete Successfully";
                response.ResponseCode = "000";
                response.IsSuccessful = true;
                return StatusCode(201, response);
            }
            catch (Exception e)
            {
                response.ResponseMessage = e.Message;
                response.ResponseCode = "911";
                _logger.LogError($"API Scope Creation Error {JsonConvert.SerializeObject(e)}");
                return StatusCode(500, response);
            }

        }

        [HttpPost]
        [Route("client")]
        public async Task<IActionResult> CreateClient(NewClientDto request)
        {
            var response = new DefaultResponse();
            _logger.LogInformation($"Client Creation Request {request.ClientId}");
            try
            {
                
                var client = await _authRepository.CreateNewClient(request);
                if (string.IsNullOrEmpty(client.ClientId))
                {
                    response.ResponseCode = "913";
                    response.ResponseMessage = "Client Already Exist";
                    return Ok(response);
                }
                response.IsSuccessful = true;
                response.ResponseMessage = "Client Created Successfully!";
                response.ResponseCode = "000";
                return StatusCode(201, response);

            }
            catch (Exception e)
            {
                response.ResponseCode = "907";
                response.ResponseMessage = e.Message;
                _logger.LogError($"Client Creation Error {JsonConvert.SerializeObject(e)}");
                return StatusCode(500, response);
            }

        }
    }
}
