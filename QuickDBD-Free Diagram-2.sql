-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/aKZvAB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Case_country" (
    "Country" TEXT   NOT NULL,
    "date" DATE   NOT NULL,
    "Confirmed" INT   NOT NULL,
    "Deaths" INT   NOT NULL,
    "Recovered" INT   NOT NULL
);

CREATE TABLE "TotalCase_location" (
    "Location_id" INT   NOT NULL,
    "Confirmed" INT   NOT NULL,
    "Deaths" INT   NOT NULL,
    "Recovered" INT   NOT NULL,
    "Latest_date" Date   NOT NULL
);

CREATE TABLE "Geography" (
    "Location_id" INT   NOT NULL,
    "Country" TEXT   NOT NULL,
    "StateProvince" TEXT   NOT NULL,
    "Longitude" FLOAT   NOT NULL,
    "Latitude" FLOAT   NOT NULL,
    CONSTRAINT "pk_Geography" PRIMARY KEY (
        "Location_id"
     )
);

CREATE TABLE "Case" (
    "Location_id" INT   NOT NULL,
    "Date_reported" DATE   NOT NULL,
    "StateProvince" TEXT   NOT NULL,
    "Country" TEXT   NOT NULL,
    "Confirmed" INT   NOT NULL,
    "Deaths" INT   NOT NULL,
    "Recovered" INT   NOT NULL
);

ALTER TABLE "TotalCase_location" ADD CONSTRAINT "fk_TotalCase_location_Location_id" FOREIGN KEY("Location_id")
REFERENCES "Geography" ("Location_id");

ALTER TABLE "Case" ADD CONSTRAINT "fk_Case_Location_id" FOREIGN KEY("Location_id")
REFERENCES "Geography" ("Location_id");

