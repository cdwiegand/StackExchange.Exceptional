CREATE TABLE "Exceptions"(
	"Id" bigserial NOT NULL ,
	"GUID" uuid NOT NULL,
	"ApplicationName" character varying(50) NOT NULL,
	"MachineName" character varying(50) NOT NULL,
	"CreationDate" timestamp NOT NULL,
	"Type" character varying(100) NOT NULL,
	"IsProtected" boolean NOT NULL default False,
	"Host" character varying(100) NULL,
	"Url" character varying(500) NULL,
	"HTTPMethod" character varying(10) NULL,
	"IPAddress" character varying(40) NULL,
	"Source" character varying(100) NULL,
	"Message" character varying(1000) NULL,
	"Detail" text NULL,	
	"StatusCode" integer NULL,
	"SQL" text NULL,
	"DeletionDate" timestamp NULL,
	"FullJson" text NULL,
	"ErrorHash" integer NULL,
	"DuplicateCount" integer NOT NULL default(1),
  CONSTRAINT pk_Exceptions PRIMARY KEY ("Id")
);

CREATE UNIQUE  INDEX "IX_Exceptions_GUID_ApplicationName_DeletionDate_CreationDate" ON "Exceptions" 
(
	"GUID" ASC,
	"ApplicationName" ASC,
	"DeletionDate" ASC,
	"CreationDate" DESC
);

CREATE  INDEX "IX_Exceptions_ErrorHash_ApplicationName_CreationDate_DeletionDate" ON "Exceptions" 
(
	"ErrorHash" ASC,
	"ApplicationName" ASC,
	"CreationDate" DESC,
	"DeletionDate" ASC
);

CREATE  INDEX "IX_Exceptions_ApplicationName_DeletionDate_CreationDate_Filtered" ON "Exceptions" 
(
	"ApplicationName" ASC,
	"DeletionDate" ASC,
	"CreationDate" DESC
)
WHERE "DeletionDate" Is Null