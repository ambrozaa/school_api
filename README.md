# School Management System API

Это приложение для управления школами, классами и студентами.

## Установка

1. **Клонируйте репозиторий:**

    ```bash
    git clone git@github.com:ambrozaa/school_api.git
    cd school_api
    ```

2. **Соберите образы Docker:**

    ```bash
    docker-compose build
    ```
3. **Инициализация базы данных:**

   Выполните миграции и загрузите начальные данные:

    ```bash
    docker-compose run web rails db:migrate
    docker-compose run web rails db:seed
    ```
   
4. **Запустите контейнеры:**

    ```bash
    docker-compose up
    ```

## Использование

Приложение предоставляет следующие API-эндпоинты:

### Получение студентов класса

- **URL:** `/schools/:school_id/classes/:class_id/students`
- **Метод:** `GET`
- **Параметры:**
    - `school_id` - ID школы
    - `class_id` - ID класса

### Получение классов школы

- **URL:** `/schools/:school_id/classes`
- **Метод:** `GET`
- **Параметры:**
    - `school_id` - ID школы

### Создание студента

- **URL:** `/students`
- **Метод:** `POST`
- **Тело запроса:**
  ```json
  {
    "student": {
      "first_name": "Имя",
      "last_name": "Фамилия",
      "surname": "Отчество",
      "class_id": 1,
      "school_id": 1
    }
  }

### Удаление студента

- URL: `/students/:id`
- Метод: `DELETE`
- Параметры:
  - `id` - ID студента


### Зависимости

- Ruby 3.3.0
- Rails 7.1
- PostgreSQL 13