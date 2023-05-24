
CREATE SCHEMA IF NOT EXISTS sql_practice_lesson_18
DEFAULT CHARACTER SET utf8 ;
USE sql_practice_lesson_18;

commit;

CREATE TABLE movies (
    id BIGINT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

commit;