-- Exploratory Data Analysis

SELECT * FROM world_layoffs.layoffs_staging2;

-- Let's see what is the maximum number of people that got laid off and the maximum percentage_laid_off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Let's see those companies where the percentage_laid_off = 1 meaning the companies who laid off 100% of their employees sorted by maximum total_laid_off column
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Let's see the companies where the percentage_laid_off = 1 sorted by maximum funds_raised
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Let's see the companies and the sum of total_laid_off
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Let's take a look at the date ranges
SELECT MIN(`date`), MAX(`date`)
from layoffs_staging2;

-- Let's see which industry was most affected by layoffs
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Let's see which countries were most affected by layoffs
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Let's see which year had the most layoffs 
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- Let's check the rolling total
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;


