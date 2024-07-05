# Music Studio Database Management System (MusicStudioDBMS)

This project aims to create a database management system for a music studio using Java and PostgreSQL. It includes tables and relationships to manage the studio's courses, customers, reservations, and payments.

## Project Structure

- **sql/**: Directory containing SQL files.
  - `createdb.sql`: Initializes the database schema and initial data.
  - `musicstudio.sql`: Defines the database schema specific to the music studio.
  - `queries.sql`: Contains sample queries.

## Usage Guide

### Cloning the Project

To clone the project to your local machine, use the following command:

```bash
git clone https://github.com/sancakerkan/MusicStudioDBMS.git
```
### Setting Up the Database

1. Install PostgreSQL: If not already installed, download and install the latest version of [PostgreSQL](https://www.postgresql.org/).
2. Create the Database: Use createdb.sql to create a new database in PostgreSQL and load initial data:
   ```bash
   psql -U username -d database_name -a -f createdb.sql
   ```
3. Load Database Schema and Sample Data: Use musicstudio.sql to load the music studio database schema and sample data:
    ```bash
   psql -U username -d database_name -a -f musicstudio.sql
    ```
4. Insert Sample Data: If needed, insert sample data using queries.sql.
    ```bash
   psql -U username -d database -a -f queries.sql
    ```
## Contributing

For any feedback, questions, or contributions, please use the issues section.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
