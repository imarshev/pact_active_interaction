# Ruby on Rails Test Assignment for Pact

## Overview

This repository contains the solution for a test assignment where I was tasked with refactoring and correcting a Ruby on Rails application, focusing mainly on the integration with the `active_interaction` gem.

## File Structure

The repository is structured with the necessary Ruby on Rails directory hierarchy. Here is a breakdown of the key files and their respective functionalities:

- **/app/interactions/user/create.rb** – This file contains the main interaction class responsible for user creation, validating the necessary inputs and handling the user creation process using `active_interaction`.

- **/app/models/user.rb** – Defines the User model and its relationships with Interest and Skill models.

- **/app/models/interest.rb** – Defines the Interest model and its relationship with the User model.

- **/app/models/skill.rb** – Defines the Skill model and its relationship with the User model.

## Migrations

Three migrations were created to handle the database schema:

- **CreateJoinTableForUsersAndInterests**: Establishes a many-to-many relationship between users and interests.
- **CreateJoinTableForUsersAndSkills**: Establishes a many-to-many relationship between users and skills.
- **RemoveColumnsSkillsAndInterestsFromUsers**: Removes the string columns `skills` and `interests` from the `users` table, as these are now managed through join tables.

## Installation

This repository doesn't contain a full-fledged Rails application but specific key files that demonstrate the refactoring process for the test assignment. To integrate these files into your Rails application, follow the steps below:

1. **Copy Files**: Manually copy the files from this repository into the corresponding directories in your Rails application:

    - `/app/interactions/user/create.rb`
    - `/app/models/user.rb`
    - `/app/models/interest.rb`
    - `/app/models/skill.rb`

    And place the migration files into your `/db/migrate` folder.

2. **Update Gemfile**: Add the `active_interaction` gem to your Gemfile:

    ```ruby
    gem 'active_interaction'
    ```

3. **Bundle Install**: Install the new gem by running the following command in your terminal:

    ```sh
    bundle install
    ```

4. **Run Migrations**: Run the migrations to update the database:

    ```sh
    rails db:migrate
    ```

## Usage

To create a new user, initialize a new `User::Create` interaction with the necessary parameters and call the `run` method to execute the interaction:

\`\`\`ruby
result = User::Create.run(
  name: 'John',
  surname: 'Doe',
  patronymic: 'Middle',
  email: 'john.doe@example.com',
  age: 25,
  nationality: 'American',
  country: 'USA',
  gender: 'male',
  interests: [...],
  skills: [...]
)

if result.valid?
  # User created successfully
else
  # Handle validation errors
end
\`\`\`
