-- Queries used for Data Visualization in Tableau

-- 1. Query for Tableau Table 1

SELECT SUM(new_cases) as total_cases, 
	SUM(cast(new_deaths as int)) as total_deaths, 
	SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM portfolioproject.coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

-- 2.  Query for Tableau Table 2

SELECT location, 
	SUM(cast(new_deaths as int)) as TotalDeathCount
FROM portfolioproject.coviddeaths
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income', 'Oceania' )
GROUP BY location
ORDER BY TotalDeathCount desc


-- 3. Query for Tableau Table 3

SELECT Location,
	ISNULL(Population, 0) as Population, 
	ISNULL(MAX(total_cases), 0) as HighestInfectionCount,  
	ISNULL(Max((total_cases/population))*100, 0) as PercentPopulationInfected
FROM portfolioproject.coviddeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC


-- 4. Query for Tableau Table 4


SELECT Location, 
	ISNULL(Population, 0),
	date, 
	ISNULL(MAX(total_cases), 0) as HighestInfectionCount,  
	ISNULL(Max((total_cases/population))*100, 0) as PercentPopulationInfected
FROM portfolioproject.coviddeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC