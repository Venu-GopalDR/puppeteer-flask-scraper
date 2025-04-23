# Puppeteer + Flask Scraper

## 🛠 Build the Docker Image
```bash
docker build --build-arg SCRAPE_URL="https://example.com" -t puppeteer-flask-scraper .
```

## 🚀 Run the Container
```bash
docker run -p 5000:5000 puppeteer-flask-scraper
```

## 🌐 Access Scraped Data
Visit: `http://localhost:5000`
