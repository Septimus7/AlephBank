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
                                 },
                                 {
                                     user: users[1],
                                     contractor_name: 'Jan Kowalski',
                                     contractor_address: 'ul. Malinowa 789j/90 Kędzierzyn-Koźle',
                                     contractor_account_number: '0000000',
                                     account: accounts[1],
                                     title: 'przelewik',
                                     amount: 999.99
                                 },
                                 {
                                     user: users[1],
                                     contractor_name: 'Anna Nowak',
                                     contractor_address: 'brak',
                                     contractor_account_number: '00 0000 0000 0000 0000 0000',
                                     account: accounts[1],
                                     title: 'za pizzę',
                                     amount: 10.56
                                 }
                             ])


HelpEntry.first_or_create([
                             {
                                 title: 'Informacje o banku',
                                 description: 'Jesteśmy małym, acz dobrze prosperującym bankiem...',
                             },
                             {
                                 title: 'Logowanie',
                                 description: 'Coś tu będzie'
                             },
                             {
                                 title: 'Nowy przelew',
                                 description: 'Coś tu będzie'
                             },
                             {
                                 title: 'Historia operacji',
                                 description: 'Coś tu będzie'
                             },
                             {
                                 title: 'Osoby słabo widzące',
                                 description: 'Portal bankowości internetowej Aleph Banku jest przystosowany do użytku przez osoby słabo widzące.</p><p>Istnieje możliwość zmiany rozmiaru tekstu na większy. Służą do tego przyciski z literą <strong>A</strong> w lewym górnym rogu ekranu, tuż obok logo banku.</p><p>Aktualnie wybrany rozmiar czcionki podświetlony jest na fioletowo. Dostępne rozmiary czcionek to <a href="javascript:void(0)" onclick="setFontSize(0)">standardowy</a>, <a href="javascript:void(0)" onclick="setFontSize(1)">duży</a> i <a href="javascript:void(0)" onclick="setFontSize(2)">bardzo duży</a>.'
                             }
                         ])