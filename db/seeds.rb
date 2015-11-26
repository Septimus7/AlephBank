users = User.first_or_create([
                                 {
                                     first_name: 'Tomasz',
                                     last_name: 'Wlisłocki',
                                     login: 'twlislocki',
                                     password: 'MareczekJestSpoko',
                                     password_confirmation: 'MareczekJestSpoko'
                                 }
                             ])
# Damian albo tu sobie możesz stworzyć konto albo przez konsolę - na heroku robisz `heroku run rails c production`