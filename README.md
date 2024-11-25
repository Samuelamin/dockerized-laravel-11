
# Dockerized Laravel 11

This repository contains a Laravel 11 application pre-configured to run inside a Docker environment. It includes all the necessary services and configurations to quickly start development or deployment.

## Features

- **Laravel 11**: The latest version of Laravel.
- **Jetstream authentication**: The latest version of Laravel jetstrream.
- **Dockerized Environment**: Includes PHP, Nginx, Reids , MySQL and other essential services.
- **Ease of Use**: Simple setup with `docker-compose`.
- **Ready for Development and Deployment**.

---

## Requirements

Ensure you have the following installed on your system:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/Samuelamin/dockerized-laravel-11
cd dockerized-laravel-11
```

### 2. Configure Environment Variables
Copy the `.env.example` to `.env` and configure it as needed:
```bash
cp .env.example .env
```

> Make sure the database credentials in `.env` match the `docker-compose.yml` configuration.

### 3. Build and Start Docker Containers
Run the following command to build and start the application:
```bash
docker-compose up -d
```

### 4. Install Laravel Dependencies
Run the following command inside the PHP container to install Laravel dependencies:
```bash
docker exec -it php-container-name composer install
```

### 5. Generate Application Key
Inside the PHP container, generate the Laravel application key:
```bash
docker exec -it php-container-name php artisan key:generate
```

---

## Usage

### Access the Application
- Visit the application in your browser at: [http://localhost:8000](http://localhost:8000)

### Access the Database
- Use a database client like [phpMyAdmin](https://www.phpmyadmin.net/) or MySQL Workbench.
- Host: `localhost`
- Port: `3306`
- Username and Password: As configured in `.env`

### Stopping the Containers
To stop the Docker containers:
```bash
docker-compose down
```

---

## Containers

- **PHP**: Runs Laravel.
- **Nginx**: Serves the Laravel application.
- **MySQL**: Database server.
- **Redis** : For caching and queues.
- **PhpMyAdmin** *(optional)*: For mysql ui.

---

## Troubleshooting

- If you encounter permission issues, run:
  ```bash
  sudo chown -R $USER:$USER .
  ```
- To clear caches:
  ```bash
  docker exec -it php-container-name php artisan cache:clear
  ```

---

## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests.

---

## License

This project is licensed under the [MIT License](LICENSE).

---
