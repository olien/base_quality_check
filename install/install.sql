-- Adminer 4.8.4 MySQL 5.7.39 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

INSERT INTO `rex_base_quality_check` (`id`, `title`, `second_title`, `group`, `subgroup`, `description`, `source`, `links`, `prio`, `status`, `check`) VALUES
(1,	'Favicons',	'Jedes Favicon wurde erstellt und wird korrekt angezeigt. ',	'1',	'13',	'<p>Wenn du nur eine favicon.ico hast, lege sie in das Stammverzeichnis deiner Seite. Normalerweise brauchst du keine Markup verwenden. Es ist jedoch trotzdem eine gute Praxis, darauf zu verlinken, wie im folgenden Beispiel gezeigt. Heutzutage wird das PNG-Format gegenüber dem .ico-Format empfohlen (Abmessungen: 32x32px).</p><p>&nbsp;</p>',	'<pre><code class=\"block_html\">&lt;!-- Standard favicon --&gt;\r\n&lt;link rel=\"icon\" type=\"image/x-icon\" href=\"https://example.com/favicon.ico\"&gt;\r\n&lt;!-- Recommended favicon format --&gt;\r\n&lt;link rel=\"icon\" type=\"image/png\" href=\"https://example.com/favicon.png\"&gt;\r\n&lt;!-- Recommended modern favicon format (not recommended for legacy browsers) --&gt;\r\n&lt;link rel=\"icon\" type=\"image/svg+xml\" href=\"https://example.com/favicon.svg\"&gt;\r\n</code></pre>',	'<p>Favicon Generator<br>RealFaviconGenerator<br>Favicon Cheat Sheet<br>Favicons, Touch Icons, Tile Icons, etc. Which Do You Need? - CSS Tricks<br>PNG favicons - caniuse<br>&nbsp;</p>',	2,	'1',	0),
(2,	'Titel',	'Ein individueller Seitentitel sollte auf allen Seiten enthalten sein.',	'1',	'16',	'<p>SEO: Google kalkuliert zum Beispiel die Pixelbreite der Zeichen, welche im Titel verwendet werden und schneidet den Titel zwischen 472 und 482 Pixel. Das Durchschnittszeichenlimit liegt bei ca. 55 Zeichen.</p>',	'<pre><code class=\"block_html\">&lt;!-- Dokument Titel --&gt;\r\n&lt;title&gt;Page Title less than 55 characters&lt;/title&gt;</code></pre>',	'<ul><li><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title\">Titel - HTML - MDN</a></li><li><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.sistrix.com/serp-snippet-generator/\">SERP Snippet Generator</a></li></ul>',	1,	'1',	0),
(7,	'Debug Modus',	'Ist der Debug Modus ausgeschaltet?',	'3',	'14',	'',	'',	'',	14,	'1',	0),
(8,	'Ungenutzte AddOns',	'Sind alle ungenutzen AddOns deinstalliert und gelöscht?',	'3',	'14',	'<p>Diese AddOns werden vermutlich nicht für den Live Betrieb der Website benötigt:</p><ul><li>Adminer / AdminerEvo</li><li>Base Quality Check</li><li>ICEcoder</li><li>Modulsammlung</li><li>RexStan</li></ul><p>Sind sonst noch AddOns installiert, die nicht zwingend benötigt werden?</p>',	'',	'',	16,	'1',	0),
(9,	'Backup Cronjob',	'Ist ein Backup Cronjob eingerichtet?',	'2',	'13',	'',	'',	'',	12,	'1',	0),
(10,	'Error Log',	'Ist das Error Log leer?',	'2',	'13',	'',	'',	'',	8,	'1',	0),
(11,	'URLs',	'Sind die URLs richtig eingetragen (System, YRewrite, URL)?',	'2',	'14',	'',	'',	'',	10,	'1',	0),
(12,	'PHP Mailer / SMTP',	'Ist im AddOn PHPMailer der Mailer Typ auf SMTP eingestellt, die Zugangsdaten eingegeben und wurde alles und getestet?',	'2',	'14',	'',	'',	'',	13,	'1',	0),
(13,	'YForm Formulare SPAM',	'Sind YForm Formulare gegen SPAM geschützt?',	'2',	'7',	'<p>Ist das Addon <strong>yform_spam_protection</strong> installiert und wird genutzt?</p>',	'<p><strong>PHP-Schreibweise</strong></p><pre><code class=\"block_php\">$yform-&gt;setValueField(\'spam_protection\', array(\"honeypot\",\"Bitte nicht ausfüllen.\",\"Ihre Anfrage wurde als Spam erkannt und gelöscht. Bitte versuchen Sie es in einigen Minuten erneut oder wenden Sie sich persönlich an uns.\", 0));</code></pre><p><br><strong>Pipe-Schreibweise</strong></p><pre><code class=\"block_php\">spam_protection|honeypot|Bitte nicht ausfüllen|Ihre Anfrage wurde als Spam erkannt und gelöscht. Bitte versuchen Sie es in einigen Minuten erneut oder wenden Sie sich persönlich an uns.|0\r\n</code></pre>',	'<ul><li><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://github.com/FriendsOfREDAXO/yform_spam_protection\">https://github.com/FriendsOfREDAXO/yform_spam_protection</a></li></ul>',	11,	'1',	0),
(14,	'Blindtexte',	'Sind alle Blindtexte entfernt?',	'3',	'17',	'',	'',	'',	17,	'1',	0),
(15,	'Formulare',	'Funktionieren alle Formulare?',	'1',	'15',	'<p>Was soll getestet werden?</p><ul><li>Ist das Formular per Tastatur bedienbar?</li><li>Werden Fehlermeldungen für alle Pflichtfelder ausgegeben?</li><li>Sind die richtigen Empfänger E-Mail Adressen eingetragen?</li><li>Bei mehrstufigen Formularen: Bleiben die Values erhalten wenn man einen “Step zurück” geht?</li><li>Ist das Formular sicher vor Injections?</li><li>Gibt es ein “Danke\" Text oder wird auf eine “Danke” Seite weitergeleitet?</li></ul>',	'',	'',	4,	'1',	0),
(16,	'Cookie Consent',	'Muß auf Cookies hingewiesen werden?',	'1',	'13',	'<p>Wenn ja bitte das Addon Consent Manager von FOR installieren, einrichten und unbedingt die korrekte Funktion testen!</p>',	'',	'',	3,	'1',	0),
(17,	'Nicht verwendete Module ',	'Gibt es ungenutzte Module die gelöscht werden können?',	'3',	'14',	'',	'',	'',	18,	'1',	0),
(18,	'Nicht verwendete Templates ',	'Gibt es ungenutzte Templates die gelöscht werden können?',	'3',	'14',	'',	'',	'',	19,	'1',	0),
(19,	'Ungenutzte Medien',	'Sind alle ungenutzten Dateien (Medienpool / Server) entfernt?',	'3',	'17',	'',	'',	'',	15,	'1',	0),
(20,	'Alt und Title Tag',	'Werden Alt und Title Tag richtig genutzt?',	'1',	'6',	'<p><strong>Redaxo Medienpool: Der Text für das Alt Tag kommt in das Feld \"Beschreibung\" und der Text &nbsp;für das Title Tag in das Feld “Titel”</strong></p><p>&nbsp;</p><p><strong>Bild-alt-Tag (alt-Attribut):</strong></p><ul><li>Zweck: Wird verwendet, um eine Textalternative für Bilder bereitzustellen.</li><li>Verwendung: Wichtig für die Barrierefreiheit, da Bildschirmleser den alt-Text vorlesen können, damit sehbehinderte Benutzer wissen, was auf dem Bild dargestellt ist.</li><li>Suchmaschinen: Suchmaschinen verwenden den alt-Text, um den Inhalt des Bildes zu verstehen und es in den Suchergebnissen zu indexieren.<br>&nbsp;</li></ul><p><strong>Bildtitel (title-Attribut):</strong></p><ul><li>Zweck: Dient dazu, zusätzliche Informationen bereitzustellen, die angezeigt werden, wenn ein Benutzer mit der Maus über das Bild fährt.</li><li>Verwendung: Hilfreich für Benutzer, die mehr Kontext oder Details zum Bild benötigen.</li></ul><p>&nbsp;</p><p>Zusammengefasst: Der Bild-alt-Tag ist essenziell für die Barrierefreiheit und Suchmaschinenoptimierung (SEO), während der Bildtitel eher für die Benutzerfreundlichkeit und die Bereitstellung zusätzlicher Informationen für den Benutzer gedacht ist.</p><p>&nbsp;</p>',	'',	'',	5,	'1',	0),
(21,	'Lazy Loading',	'Wird Lazy Loading genutzt? - Auch für Scripts und CSS?!',	'1',	'8',	'',	'',	'',	9,	'1',	0),
(22,	'Description',	'Seitenbeschreibung (Description)',	'1',	'16',	'<p>Die Description (auch Meta-Description genannt) bietet Raum für eine Kurzbeschreibung des Webseiten-Inhalts. Da auch dieser Meta-Tag von etablierten Suchmaschinen wie Google, Bing und Co. als Snippet in die SERPs übernommen wird, empfiehlt sich eine sorgfältige redaktionelle Aufbereitung. Aufgrund ihrer Bedeutung für das Klickverhalten in der Websuche gilt die Description als einer der wichtigsten HTML-Meta-Tags für die Suchmaschinenoptimierung. Webseiten-Betreiber sollten beim Description-Text darauf achten, nicht mehr als 160 Zeichen zu verwenden – inklusive Leerzeichen. Andernfalls besteht die Gefahr, dass die überzähligen Zeichen in der Suchmaschinenanzeige abgeschnitten werden und die Description unvollständig in der Ergebnisliste auftaucht. Der Meta-Description-Tag richtet sich in erster Linie an den Internetnutzer und sollte daher eine prägnante Zusammenfassung des Seiteninhalts geben. Laut Google sollten Betreiber darauf achten, dass jede Webseite über eine individuelle Description verfügt, die präzise Informationen über den Webseiten-Inhalt liefert. So bietet das Attribut dem Nutzer einen klaren Mehrwert und hilft Webseiten-Betreibern, die Klickrate in der Websuche zu erhöhen. In der Meta-Description dieser Webseite befinden sich beispielsweise folgende Angaben:</p>',	'<pre><code class=\"block_html\">&lt;meta name=\"description\" content=\"Diese Meta-Tags sollten Sie kennen! Mit HTML-Meta-Tags werden Informationen für Browser und Suchmaschinen codiert. Doch welche Angaben sind wirklich wichtig?\"/&gt;</code></pre>',	'',	6,	'1',	0),
(23,	'Dateiformat',	'Werden - wenn möglich -  moderne Formate wie z.B. WEBP genutzt?',	'1',	'6',	'',	'',	'',	7,	'1',	0),
(24,	'Copyright',	'Bilder Copyright',	'3',	'17',	'<ul><li>Ist das Copyright für die Bilder eingetragen?</li><li>Wird das Copyright “am Bild” ausgegeben?</li><li>Muß nochmals im Impressum darauf hingewiesen werden?&nbsp;</li><li>Gibt es Medien deren Verwendung zeitlich eingeschränkt ist?</li></ul>',	'',	'',	20,	'1',	0);

INSERT INTO `rex_base_quality_check_group` (`id`, `prio`, `group`, `status`) VALUES
(1,	1,	'Frontend',	'1'),
(2,	2,	'Backend',	'1'),
(3,	3,	'Live',	'1');

INSERT INTO `rex_base_quality_check_sub_group` (`id`, `subgroup`, `prio`, `status`) VALUES
(1,	'Header',	1,	''),
(2,	'HTML',	2,	''),
(3,	'Webfonts',	6,	''),
(4,	'CSS',	4,	''),
(5,	'JavaScript',	7,	''),
(6,	'Bilder',	5,	''),
(7,	'Accessibility',	8,	''),
(8,	'Performance',	9,	''),
(9,	'Best Practice',	10,	''),
(10,	'SEO',	11,	''),
(11,	'Sicherheit',	12,	''),
(13,	'Sonstiges',	14,	''),
(14,	'REDAXO',	15,	'1'),
(15,	'Testen',	13,	'1'),
(16,	'Meta-Tags',	3,	'1'),
(17,	'Inhalte',	16,	'1');

-- 2024-07-11 08:05:58