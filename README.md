# ROR1

<a name="readme-top"></a>
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#sumary">sumary</a></li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#docs">Docs</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

## sumary

This is a Ruby on Rails application that allows you to manage students, teachers, courses, and grades. The application uses Docker for containerization, Stimulus for front-end development, and SQLite for the database.

## Prerequisites

Before running the application, you must have the following installed on your computer:

- Docker
- Ruby 3.10
- Bundler

## Installation

To install the application, follow these steps:

Clone the repository to your local machine:

```sh
git clone https://github.com/antbou/ROR.git
cd ROR
```

Install the dependencies:

```sh
bundle install
```

Create database

```sh
rails db:create
```

 Run migrations

```sh
rails db:migrate
```

 Seed database

```sh
rails db:seed:replant
```

Build the Docker container:

```sh
docker-compose up -d --build
```

Or run the built-in web server

```sh
bin/rails server
```

Open your browser and go to `http://localhost:5000`.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Docs

The specifications and the architectural diagram can be found in the docs folder

## Features

### User management

The application allows you to create, delete, and update students using the Currency gem. You can also authenticate users.

### Teacher management

You can define a user as a teacher by modifying the database manually. When a teacher logs in, they see the list of courses they teach. An interface for this is a bonus point.

### Grade management

As a teacher, you can put grades for students by clicking on a course.

### Course management

As a teacher, you can add a course and assign a class to it.

### Class management

As a teacher, you can create a class and assign students to it.

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.
