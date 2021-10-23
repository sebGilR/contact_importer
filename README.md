# Contact Importer

The application allows users to upload contact files in CSV format and process them in order
to generate a unified contact file. The contacts must be associated with the user who imported
them into the platform. When uploading the files, the application must validate that the fields
entered are correctly formatted.

## Live Website
[Visit website](https://contact-importer-sg.herokuapp.com/)

### Demo user
Email: `user@email.com`

Password: `userpassword`

## Demo Video
[View Loom Video](https://www.loom.com/share/dd4e2afafc6743c894d846e3bb7cd4a6)

## Features Added

- Support for custom names. The user can provide the name they used for each column and the backend does the appropriate mapping.
- Paginated list of contacts
- Contacts scoped to the current user
- Unit testing
- CSV contact import
- Validation for unique contact email per user
- Credit card validation
- Phone number validation
- CRUD operations for contacts
- Email and password sign in

### Features not added
- Username sign in/up. Due to time constraints I decided to use Devise but didn't get enough time for modifying it to work with only a username, but this is possible.
- Viewing historical file uploads and state, not enough time to implement this feature. But it would have required an additional model to keep track of the files and related data.
- Contact name format validation is also missing, run into regex issues and left it out to prioritize other features.

## Prerequisites

- postgresql installed and running
- nodejs
- ruby 3.0.2

## Local Setup

```
git clone https://github.com/sebGilR/contact_importer.git

cd contact_importer

bundle install

rails db:create
rails db:migrate
rails db:seed
```

## Usage

Log in at: `http://localhost:3000/users/sign_in`

Email: `user@email.com`

Password: `userpassword`

CSV Files for testing located in: `spec/fixtures/files`


## Run Tests

```
rspec
```

## Gems Used for supporting some of the features

- devise
- credit_card_validations
- phony_rails
- validates_timeliness
- pagy
