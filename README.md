NewsBox
-------------------

Features:
- User können sich registrieren, Angaben ändern oder löschen
- Ein User kann Webseiten zur seiner Verfolgungsliste hinzufügen und löschen
~	Um später noch erkennen zu können was in dazu bewegt hat kann er beim Anlegen Informationen wie Name, Kommentare und ein Bild hinzufügen
- Die Verfolgten Webseiten können vorab gefiltert werden um nicht jede neue Nachricht zu bekommen, sondern nur die, die	einen interesieren. Dies geschieht schon bei dem durchsuchen der Webseite
- Es können Notizen bzw. Kommentare hinzugefügt werden um Nachrichten persöhnlich zu bewerten
- Kommen neue Nachrichten werden diese mit einer Mail an den User verschickt
- Updates die noch nicht gelesen wurden, werden erkennbar angezeigt
- Auf die Verfolgungsliste können Filter angewendet werden. Es können z.B. nur Nachrichten angezeigt werden die einen bestimmten Begriff (oder mehrere) beinhalten

Jeder User kann nur seine Verfolgunsliste einsehen und kein Sharing oder dergleichen betreiben!

Optional:
- User können prioritäten setzen um eine Art Favoriten angezeigt zu bekommen
- Videoseiten wie Youtube oder MyVideo können ebenfalls verfolgt werden.
		(Es können User verfolgt werden)
- Sammelmails: die Mails werden nur noch in einem vom User festgelegten Zeitraum verschickt


Gems:
feedjira holt und analysiert die RSS feeds
devise zum User anlegen, mails verschicken
ransack Metasuche

Image:
"New" - http://findicons.com/icon/177417/label_new_green?id=177417 

<div>Icon made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0">CC BY 3.0</a></div>



Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views