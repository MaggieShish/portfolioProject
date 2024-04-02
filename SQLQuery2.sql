SELECT *
FROM PortfolioProject.dbo.[COVID DEATHS]
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject.dbo.[COVID VACCINES]
--ORDER BY 3,4

--Select the data that we are going to be using


SELECT Location,date,total_cases,new_cases,total_deaths
FROM PortfolioProject.dbo.[COVID DEATHS]
ORDER BY 1,2

--Looking at Total Cases vs Total Deaths
SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM PortfolioProject.dbo.[COVID DEATHS]
Where location like '%states%'
ORDER BY 1,2

SELECT Dea.continent,dea.location,dea.date,Vac.population_density,Vac.new_vaccinations,
SUM(Cast(Vac.new_vaccinations as float)) OVER (PARTITION BY Dea.Location)
FROM PortfolioProject.dbo.[COVID VACCINES] Vac
JOIN PortfolioProject.dbo.[COVID DEATHS] Dea

ON  Dea.location = Vac.Location
and Dea.date = Vac.date
Where Dea.continent is not NULL
ORDER BY 2,3
