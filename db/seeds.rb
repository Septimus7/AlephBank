users = User.first_or_create([
                                 {
                                     first_name: 'Tomasz',
                                     last_name: 'Wlisłocki',
                                     login: 'twlislocki',
                                     password: 'MareczekJestSpoko',
                                     password_confirmation: 'MareczekJestSpoko'
                                 },
                                 {
                                     first_name: 'Damian',
                                     last_name: 'Mirecki',
                                     login: 'dmirecki',
                                     password: 'raz',
                                     password_confirmation: 'raz'
                                 }
                             ])
# Damian albo tu sobie możesz stworzyć konto albo przez konsolę - na heroku robisz `heroku run rails c production`

accounts = Account.first_or_create([
                                       {
                                           number: '123456',
                                           user: users[0],
                                           amount: 100.00
                                       },
                                       {
                                           number: '23 45 67 89',
                                           user: users[1],
                                           amount: 100.00
                                       },
                                       {
                                           number: '98 87 65 54',
                                           user: users[1],
                                           amount: 10.00
                                       }
                                   ])


Contact.first_or_create([
                            {
                                name: 'Jan Kowalski',
                                address: 'Komornica 12a/4',
                                account_number: '0000',
                                description: 'nie znam gościa',
                                user: users[1]
                            }
                        ])

BankTransfer.first_or_create([
                                 {
                                     user: users[1],
                                     contractor_name: 'XYZ',
                                     contractor_address: 'Komornicza',
                                     contractor_account_number: '0000000',
                                     account: accounts[1],
                                     title: 'przelewik',
                                     amount: 50.0
                                 }
                             ])