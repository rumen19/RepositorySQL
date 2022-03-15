use RepositoryDB;

Select id,username --3
from users
ORDER BY id ASC;

Select*from  RepositoriesContributors --4
where repository_id = contributor_id
ORDER BY repository_id ASC;


SELECT TOP 5 s.id,s.name,COUNT(c.id) AS issues --5
FROM repositories s
FULL OUTER JOIN issues c ON s.id = c.repository_id
Group by s.id,s.name,repository_id
ORDER BY count(c.id) desc,s.id ASC;


SELECT Distinct repositories.id,repositories.name,
COUNT(commits.repository_id) AS comits, --6
COUNT(RepositoriesContributors.contributor_id) AS contributors
FROM commits 
FULL JOIN repositories ON repositories.id = commits.id
LEFT JOIN RepositoriesContributors ON RepositoriesContributors.contributor_id = commits.contributor_id
Group by repositories.id,repositories.name
ORDER BY COUNT(RepositoriesContributors.contributor_id) DESC;

SELECT c.id,c.name,COUNT(s.contributor_id) AS users --7
FROM repositories c
RIGHT JOIN RepositoriesContributors s ON  c.id = s.repository_id
Group by c.id,c.name
ORDER BY c.id DESC,c.name DESC;