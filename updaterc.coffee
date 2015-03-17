# Fill these with your CSZO credentials
user = ''
pass = ''

casper = require('casper').create()
fs = require('fs');
data = fs.read('qw.rc');

loginForm = "form[action='#']"
rcLink = "a[class='edit_rc_link'][data-game_id='dcss-git']"
editForm = "form#rc_edit_form"

casper.start 'http://crawl.s-z.org/', ->
    @wait 5000, ->
        @fill loginForm, username: user, password: pass, true
        #@capture '1.png'
        @wait 5000, ->
            #@capture '2.png'
            @click rcLink
            @wait 5000, ->
                @fill editForm, 'rc_file_contents': data, false
                #@capture '3.png'
                @click '#rc_submit'
                @wait 5000, ->
                    #@capture '4.png'



casper.run ->
  @echo("Probably done :)").exit()
