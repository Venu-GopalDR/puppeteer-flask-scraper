# Stage 1: Node.js Scraper
FROM node:18-slim as scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./
RUN npm install

COPY scrape.js ./

# Scrape URL is passed as ENV
#ARG SCRAPE_URL
#ENV SCRAPE_URL=${SCRAPE_URL}
#RUN node scrape.js

# Stage 2: Python Server
FROM python:3.10-slim

WORKDIR /app

COPY --from=scraper /app/scraped_data.json ./scraped_data.json
COPY server.py requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "server.py"]
