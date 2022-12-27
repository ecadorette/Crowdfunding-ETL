DROP TABLE backers

CREATE TABLE "backers" (
    "backer_id" varchar(10)   NOT NULL,
    "cf_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_backers" PRIMARY KEY (
        "backer_id"
     )
);

ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY("cf_id")
REFERENCES "campaign" ("cf_id");

ALTER TABLE campaign ADD remaining_goal_amount AS CAST((goal - pledged) AS NUMBERIC(10,2));

SELECT * FROM campaign;

SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY backers_count DESC;

SELECT * 
FROM campaign
WHERE outcome = 'live'

SELECT cf_id, COUNT(cf_id)
FROM backers
GROUP BY cf_id
ORDER BY COUNT(cf_id) DESC;

SELECT contacts.first_name, 
	contacts.last_name,
	contacts.email,
	campaign.goal as "Remaining Goal Amount"
--INTO email_contacts_remaining_goal_amount
FROM contacts INNER JOIN campaign ON contacts.contact_id = campaign.contact_id
WHERE outcome = 'live'
ORDER BY goal DESC;

SELECT backers.first_name, 
	backers.last_name,
	backers.email,
	campaign.goal as "Remaining Goal Amount"
--INTO email_contacts_remaining_goal_amount
FROM backers INNER JOIN campaign ON backers.cf_id = campaign.cf_id
WHERE outcome = 'live'
ORDER BY goal DESC;