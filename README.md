# Liquibase Dashboard

Liquibase Dashboard is a Ruby on Rails Application that allows you do basic modeling of Application->Schema->Environment relationships connecting to the specific schema Liquibase DATABASECHANGELOGs to facilitate easy viewing of database change deployments.

## Installation

1. Install Ruby  2.1
2. Install Rails 4
3. bundle install
4. rake db:migrate
5. rails s

## Components

- Twitter Bootstrap 3 - http://getbootstrap.com/
- Start Bootstrap - http://startbootstrap.com/
- Internal Database: SQLite3
- Supported Liquibase Databases: MySQL

## Usage

1. Add Application
2. Add Environment(s)
3. Add Schemas(s)

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Enhancement Ideas

1. Encrypt database password
2. Error handling with bad database connections
3. Settings Configuration
   - Days for most recent
   - Weeks to show deployments
4. Deployment Vires
	 - Calendar/Timeline View
5. Support for more database platforms
6. User Management
   - Roles & Permissions

## History

2014-11-18 In the beginning...

## Credits

The Liquibase Dashboard is written and maintained by Carey Benge and contributors.

## License

Copyright 2014 Datical, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.