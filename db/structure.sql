CREATE TABLE "activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "client_id" integer, "rate" varchar(255), "date" date, "time" time, "status" varchar(255), "created_at" datetime, "updated_at" datetime, "bid_id" integer);
CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime, "dogsize" varchar(255), "user_id" integer, "activities_id" integer);
CREATE TABLE "dog_walkers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime, "breeds" varchar(255), "experience" varchar(255), "rate" varchar(255), "user_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "phone" integer, "user_type" varchar(255), "password" varchar(255), "address" varchar(255), "profile_pic" varchar(255), "created_at" datetime, "updated_at" datetime, "first_name" varchar(255), "last_name" varchar(255), "availability" varchar(255), "zipcode" integer);
CREATE TABLE "walker_bids" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "walker_id" integer, "bid_id" integer, "created_at" datetime, "updated_at" datetime,"activities_id" integer);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131120024329');

INSERT INTO schema_migrations (version) VALUES ('20131120032947');

INSERT INTO schema_migrations (version) VALUES ('20131123004712');

INSERT INTO schema_migrations (version) VALUES ('20131123193839');

INSERT INTO schema_migrations (version) VALUES ('20131123194221');

INSERT INTO schema_migrations (version) VALUES ('20131123194520');

INSERT INTO schema_migrations (version) VALUES ('20131123194530');

INSERT INTO schema_migrations (version) VALUES ('20131123195017');

INSERT INTO schema_migrations (version) VALUES ('20131127025302');
