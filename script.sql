USE [identityserver]
GO
/****** Object:  StoredProcedure [dbo].[StoreClientDetails]    Script Date: 06/10/2020 08:55:00 ******/
DROP PROCEDURE [dbo].[StoreClientDetails]
GO
ALTER TABLE [dbo].[IdentityResourceProperties] DROP CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims] DROP CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[ClientSecrets] DROP CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes] DROP CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris] DROP CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties] DROP CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] DROP CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] DROP CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes] DROP CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins] DROP CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientClaims] DROP CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[ApiScopeProperties] DROP CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeClaims] DROP CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets] DROP CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes] DROP CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties] DROP CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceClaims] DROP CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_PersistedGrants_Expiration]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_PersistedGrants_Expiration] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
GO
/****** Object:  Index [IX_IdentityResourceProperties_IdentityResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_IdentityResourceProperties_IdentityResourceId] ON [dbo].[IdentityResourceProperties]
GO
/****** Object:  Index [IX_IdentityResourceClaims_IdentityResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_IdentityResourceClaims_IdentityResourceId] ON [dbo].[IdentityResourceClaims]
GO
/****** Object:  Index [IX_DeviceCodes_Expiration]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_DeviceCodes_Expiration] ON [dbo].[DeviceCodes]
GO
/****** Object:  Index [IX_DeviceCodes_DeviceCode]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_DeviceCodes_DeviceCode] ON [dbo].[DeviceCodes]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
GO
/****** Object:  Index [IX_ApiScopeProperties_ScopeId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiScopeProperties_ScopeId] ON [dbo].[ApiScopeProperties]
GO
/****** Object:  Index [IX_ApiScopeClaims_ScopeId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiScopeClaims_ScopeId] ON [dbo].[ApiScopeClaims]
GO
/****** Object:  Index [IX_ApiResourceSecrets_ApiResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiResourceSecrets_ApiResourceId] ON [dbo].[ApiResourceSecrets]
GO
/****** Object:  Index [IX_ApiResourceScopes_ApiResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiResourceScopes_ApiResourceId] ON [dbo].[ApiResourceScopes]
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
GO
/****** Object:  Index [IX_ApiResourceProperties_ApiResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiResourceProperties_ApiResourceId] ON [dbo].[ApiResourceProperties]
GO
/****** Object:  Index [IX_ApiResourceClaims_ApiResourceId]    Script Date: 06/10/2020 08:55:00 ******/
DROP INDEX [IX_ApiResourceClaims_ApiResourceId] ON [dbo].[ApiResourceClaims]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersistedGrants]') AND type in (N'U'))
DROP TABLE [dbo].[PersistedGrants]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResources]') AND type in (N'U'))
DROP TABLE [dbo].[IdentityResources]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResourceProperties]') AND type in (N'U'))
DROP TABLE [dbo].[IdentityResourceProperties]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResourceClaims]') AND type in (N'U'))
DROP TABLE [dbo].[IdentityResourceClaims]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceCodes]') AND type in (N'U'))
DROP TABLE [dbo].[DeviceCodes]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientSecrets]') AND type in (N'U'))
DROP TABLE [dbo].[ClientSecrets]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientScopes]') AND type in (N'U'))
DROP TABLE [dbo].[ClientScopes]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
DROP TABLE [dbo].[Clients]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientRedirectUris]') AND type in (N'U'))
DROP TABLE [dbo].[ClientRedirectUris]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientProperties]') AND type in (N'U'))
DROP TABLE [dbo].[ClientProperties]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientPostLogoutRedirectUris]') AND type in (N'U'))
DROP TABLE [dbo].[ClientPostLogoutRedirectUris]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientIdPRestrictions]') AND type in (N'U'))
DROP TABLE [dbo].[ClientIdPRestrictions]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientGrantTypes]') AND type in (N'U'))
DROP TABLE [dbo].[ClientGrantTypes]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientCorsOrigins]') AND type in (N'U'))
DROP TABLE [dbo].[ClientCorsOrigins]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientClaims]') AND type in (N'U'))
DROP TABLE [dbo].[ClientClaims]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopes]') AND type in (N'U'))
DROP TABLE [dbo].[ApiScopes]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopeProperties]') AND type in (N'U'))
DROP TABLE [dbo].[ApiScopeProperties]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopeClaims]') AND type in (N'U'))
DROP TABLE [dbo].[ApiScopeClaims]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceSecrets]') AND type in (N'U'))
DROP TABLE [dbo].[ApiResourceSecrets]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceScopes]') AND type in (N'U'))
DROP TABLE [dbo].[ApiResourceScopes]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResources]') AND type in (N'U'))
DROP TABLE [dbo].[ApiResources]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceProperties]') AND type in (N'U'))
DROP TABLE [dbo].[ApiResourceProperties]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceClaims]') AND type in (N'U'))
DROP TABLE [dbo].[ApiResourceClaims]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06/10/2020 08:55:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 06/10/2020 08:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191111190928_InitialIdentityServerPersistedGrantDbMigration', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191111190951_InitialIdentityServerConfigurationDbMigration', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191201210103_init', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200522172538_Grants', N'3.1.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200522172542_Config', N'3.1.0')
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1, 1, N'ApiTwo', N'ApiTwo', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.2287376' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (2, 1, N'ApiOne', N'ApiOne', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (3, 1, N'AccountsAPI', N'Accounts API', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (4, 1, N'PaymentsAPI', N'Payments API', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (5, 1, N'IdentityProductsAPI', N'Identity Products API', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (6, 1, N'SpecilizedAPI', N'Specilized API', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (7, 1, N'UtilitiesAPI', N'Utilities API', NULL, NULL, 1, CAST(N'2020-02-27T16:26:04.1598946' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (8, 1, N'PaymentGatewayAPI', N'PaymentGateway API', NULL, NULL, 1, CAST(N'2020-07-08T10:20:04.4500000' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1008, 1, N'TransactionsAPI', N'Utilities API', NULL, NULL, 1, CAST(N'2020-07-09T13:57:05.6266667' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1010, 1, N'QRCodePaymentAPI', N'QRCodePaymentAPI', N'QR Code Payment API', NULL, 1, CAST(N'2020-08-25T10:18:10.6933333' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1013, 1, N'offline_access ', N'Offline Access', N'Offline Access', NULL, 1, CAST(N'2020-08-25T00:00:00.0000000' AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] ON 

INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1, N'ApiTwo', 1)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (2, N'ApiOne', 2)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (3, N'AccountsAPI', 3)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (4, N'PaymentAPI', 4)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (6, N'IdentityProductsAPI', 5)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (7, N'SpecilizedAPI', 6)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (8, N'UtilitiesAPI', 7)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (9, N'PaymentGatewayAPI', 8)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1009, N'TransactionsAPI', 1008)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1012, N'QRCodePaymentAPI', 1010)
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (2, 1, N'ApiTwo', N'ApiTwo', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (3, 1, N'ApiOne', N'ApiOne', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (4, 1, N'AccountsAPI', N'AccountsAPI', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (5, 1, N'PaymentAPI', N'PaymentAPI', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (6, 1, N'IdentityProductsAPI', N'IdentityProductsAPI', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (7, 1, N'SpecilizedAPI', N'SpecilizedAPI', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (8, 1, N'UtilitiesAPI', N'UtilitiesAPI', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (9, 1, N'PaymentGatewayAPI', N'PaymentGateway API', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (10, 1, N'TransactionsAPI', N'Transactions API', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (11, 1, N'QRCodePaymentAPI', N'QRCodePaymentAPI', N'QR Code Payment API', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'08ffc5d3-d17d-4f1e-83df-139625f17f99', N'rc.apina', N'big.cookie')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'08ffc5d3-d17d-4f1e-83df-139625f17f99', N'rc.api.apina', N'big.api.cookie')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'08ffc5d3-d17d-4f1e-83df-139625f17f99', N'bob', N'BOB', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEDqi4rSxfH1cP1Hnf4U4aMTpAB23vBoQWglkI0Rtf5DZuwqDQTOSYmTeed2oOJkNjA==', N'OF3W3GXXCR5IOBOSC5YRHQBXYANXPFOF', N'c266e36b-c401-43fd-bcd0-6df25ab130c0', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'client_credentials', 4)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'authorization_code', 3)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (3, N'authorization_code', 2)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (4, N'client_credentials', 1)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (5, N'authorization_code', 3)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (6, N'client_credentials', 5)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (7, N'refresh_token', 4)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (8, N'client_credentials', 6)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (9, N'client_credentials', 7)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'client_id', N'oidc', 1, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-02-27T16:26:02.2655388' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (2, 1, N'client_id_mvc', N'oidc', 1, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 1, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-02-27T16:26:02.3646718' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (3, 1, N'client_id_js', N'oidc', 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 1, NULL, 1, NULL, 1, 0, 300, NULL, 1, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-02-27T16:26:02.3823298' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (4, 1, N'5f0594d067b9d5f0594d067b9f5f05', N'oidc', 1, N'Ynspyre App', N'API Details forYnspyre App', NULL, NULL, 1, 1, 1, 0, 0, 0, 0, NULL, 1, NULL, 1, 1, 300, NULL, 300, 300, NULL, 2592000, 1296000, 1, 1, 1296000, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-07-08T10:41:37.1300000' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (5, 1, N'5f214c16d10825f214c16d10895f21', N'oidc', 1, N'QR Code', N'API Details forQR Code', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 300, 300, NULL, 2592000, 1296000, 1, 1, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-07-29T11:14:58.8430000' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (6, 1, N'5f61e0e4bbb485f61e0e4bbb4a5f61', N'oidc', 1, N'Buddie', N'API Details forBuddie', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 300, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-09-16T10:55:01.3900000' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (7, 1, N'5f6497105daa55f6497105daa75f64', N'oidc', 1, N'YnspyreApp', N'API Details forYnspyreApp', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 300, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2020-09-18T12:16:49.4333333' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'ApiTwo', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'rc.scope', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'ApiTwo', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'UtilitiesAPI', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'SpecilizedAPI', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (6, N'IdentityProductsAPI', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (7, N'PaymentAPI', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (8, N'AccountsAPI', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (9, N'openid', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (10, N'AccountsAPI', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (11, N'PaymentAPI', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (12, N'IdentityProductsAPI', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (13, N'SpecilizedAPI', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (14, N'rc.scope', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (15, N'UtilitiesAPI', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (16, N'ApiTwo', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (17, N'UtilitiesAPI', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (18, N'SpecilizedAPI', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (19, N'IdentityProductsAPI', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (20, N'PaymentAPI', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (21, N'AccountsAPI', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (22, N'openid', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (23, N'ApiTwo', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1023, N'PaymentAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1024, N'AccountsAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1025, N'IdentityProductsAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1026, N'SpecilizedAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1027, N'PaymentGatewayAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2023, N'TransactionsAPI', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2024, N'ApiTwo', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2025, N'ApiOne', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2026, N'AccountsAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2027, N'PaymentAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2028, N'IdentityProductsAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2029, N'SpecilizedAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2030, N'UtilitiesAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2031, N'PaymentGatewayAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2032, N'TransactionsAPI', 5)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2033, N'offline_access', 4)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2034, N'ApiTwo', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2035, N'ApiOne', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2036, N'AccountsAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2037, N'PaymentAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2038, N'IdentityProductsAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2039, N'SpecilizedAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2040, N'UtilitiesAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2041, N'PaymentGatewayAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2042, N'TransactionsAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2043, N'QRCodePaymentAPI', 6)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2044, N'ApiTwo', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2045, N'ApiOne', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2046, N'AccountsAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2047, N'PaymentAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2048, N'IdentityProductsAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2049, N'SpecilizedAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2050, N'UtilitiesAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2051, N'PaymentGatewayAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2052, N'TransactionsAPI', 7)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2053, N'QRCodePaymentAPI', 7)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'ggcXyW+Yijm4Ko42lAo55AKqH2Z2bdWTMz8zMHJzXxc=', NULL, N'SharedSecret', CAST(N'2020-02-27T16:26:02.3646764' AS DateTime2), 2)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (2, NULL, N'g9FRqY6sDQzTNqEoWe5VXKHAfsvH5aef4fuiMJjTjqc=', NULL, N'SharedSecret', CAST(N'2020-02-27T16:26:02.2660903' AS DateTime2), 1)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (3, N'API Details forYnspyre App', N'dOZ0n7fpZdB8pai2R6DbunRNWk2bovJJ642LJpI2RQQ=', NULL, N'SharedSecret', CAST(N'2020-07-08T10:41:37.1700000' AS DateTime2), 4)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (4, N'API Details forQR Code', N'v6rhr9qssMAHlncgQdT0sEZOh5fiHagmeb/LXJFCIYs=', NULL, N'SharedSecret', CAST(N'2020-07-29T11:14:58.8430000' AS DateTime2), 5)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (5, N'API Details forBuddie', N'4YQv34Tp5+YaQlZbyPlXc73mwa7RAo9lCdzn7MBErqE=', NULL, N'SharedSecret', CAST(N'2020-09-16T10:55:01.4266667' AS DateTime2), 6)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (6, N'API Details forYnspyreApp', N'zrjrWFhxN0RX+qssgs3SwPG7PwRW/TqbbLcMpWO22w4=', NULL, N'SharedSecret', CAST(N'2020-09-18T12:16:49.4566667' AS DateTime2), 7)
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'rc.apina', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'sub', 2)
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'rc.scope', NULL, NULL, 0, 0, 1, CAST(N'2020-02-27T16:26:04.0083012' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2020-02-27T16:26:03.9772769' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
/****** Object:  Index [IX_ApiResourceClaims_ApiResourceId]    Script Date: 06/10/2020 08:55:02 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceClaims_ApiResourceId] ON [dbo].[ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceProperties_ApiResourceId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceProperties_ApiResourceId] ON [dbo].[ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 06/10/2020 08:55:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceScopes_ApiResourceId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceScopes_ApiResourceId] ON [dbo].[ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceSecrets_ApiResourceId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceSecrets_ApiResourceId] ON [dbo].[ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ScopeId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ScopeId] ON [dbo].[ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeProperties_ScopeId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeProperties_ScopeId] ON [dbo].[ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 06/10/2020 08:55:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DeviceCodes_DeviceCode]    Script Date: 06/10/2020 08:55:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceCodes_DeviceCode] ON [dbo].[DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeviceCodes_Expiration]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_DeviceCodes_Expiration] ON [dbo].[DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceClaims_IdentityResourceId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceClaims_IdentityResourceId] ON [dbo].[IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceProperties_IdentityResourceId]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceProperties_IdentityResourceId] ON [dbo].[IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 06/10/2020 08:55:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersistedGrants_Expiration]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_Expiration] ON [dbo].[PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 06/10/2020 08:55:03 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
/****** Object:  StoredProcedure [dbo].[StoreClientDetails]    Script Date: 06/10/2020 08:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StoreClientDetails] 
	@clientId varchar(100),
	@clientSecret varchar(999),
	@appName varchar(20),
	@description varchar(100)
AS
declare @id int,
@name varchar(100), @displayName varchar(100), @scopeDet cursor

BEGIN
  
  SET @scopeDet = CURSOR FOR
    SELECT ApiScopes.Name , ApiScopes.DisplayName
  FROM ApiScopes;


	INSERT [dbo].[Clients] ([Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description],  [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], 
	[AllowPlainTextPkce], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], 
	[BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], 
	[AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], 
	[SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], 
	[AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], 
	[Created], [DeviceCodeLifetime], [NonEditable], RequireRequestObject) 
	VALUES (1, @clientId, 'oidc', 1, @appName, @description, 1, 1, 0, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, 300, 300, 
	NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 0, 0, 'client_', NULL, getdate(), 300, 0,0);

	set @id = SCOPE_IDENTITY();

	INSERT [dbo].[ClientSecrets] ([Description], [Value],  [Type], [Created], [ClientId]) 
	VALUES (@description, @clientSecret, 'SharedSecret', getdate(), @id);


	INSERT [dbo].[ClientGrantTypes] ( [GrantType], [ClientId]) VALUES ('client_credentials', @id);

	OPEN @scopeDet
		FETCH NEXT
			FROM @scopeDet INTO @name, @displayName
			WHILE @@FETCH_STATUS = 0
				BEGIN
					INSERT [dbo].[ClientScopes] ([Scope], [ClientId]) VALUES (@name, @id);
					FETCH NEXT
					FROM @scopeDet INTO @name, @displayName
				END
	CLOSE @scopeDet
	DEALLOCATE @scopeDet
	   ---set @uniqueId =   Inserted.ID
	return @id;

 	
END


GO
