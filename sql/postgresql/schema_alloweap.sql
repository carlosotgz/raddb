CREATE TABLE raddenyeap (
        id              SERIAL PRIMARY KEY,
        UserName        VARCHAR(64) NOT NULL DEFAULT ''
);
create index raddenyeap_UserName on raddenyeap (id);
