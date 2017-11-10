<%--
  Created by IntelliJ IDEA.
  User: Tuukka
  Date: 10.11.2017
  Time: 9.27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% HttpSession istunto = request.getSession();
    String nimi =(String)istunto.getAttribute("nimi");
%>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <title>Käyttoehdot</title>
</head>
<ul class="topnav">
    <li id="nappi1" ><button id="etu"> <a href="HaeViestit">Etusivu</a></button></li>
    <li id="nappi2" ><button id="forum"> <a href="HaeKeskustelu">Foorumi</a></button></li>
    <%
        if(nimi==null){
            out.print("<li id=\"nappi3\"><button  onclick=\"document.getElementById('kirjautua').style.display='block'\">Kirjaudu sisään </button>\n" +
                    "        <div id=\"kirjautua\" class=\"modal\">\n" +
                    "            <span onclick=\"document.getElementById('kirjautua').style.display='none'\" class=\"close\" title=\"Sulje\">&times;</span>\n" +
                    "            <form class=\"modal-content animate\" action=\"Kirjaudu\" method=\"POST\">\n" +
                    "                <div class=\"container\">\n" +
                    "                    <label><b>Käyttäjätunnus</b></label>\n" +
                    "                    <input type=\"text\" placeholder=\"Syötä nimimerkki\" name=\"nimi\" required>\n" +
                    "                    <label><b>Salasana</b></label>\n" +
                    "                    <input id=\"salasanavaarin\" type=\"password\" placeholder=\"Syötä salasana\" name=\"salasana\" required>\n" +
                    "                    <div class=\"clearfix\">\n" +
                    "                        <button type=\"button\" onclick=\"document.getElementById('kirjautua').style.display='none'\" class=\"cancelbtn\">Peruuta</button>\n" +
                    "                        <button type=\"submit\" class=\"signupbtn\">Kirjaudu</button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "        </div>\n" +
                    "    </li>");
        }
    %>
    <%
        if(nimi==null){
            out.print("<li id=\"nappi4\"><button onclick=\"document.getElementById('rekisteroidy').style.display='block'\">Rekisteröidy </button>\n" +
                    "        <div id=\"rekisteroidy\" class=\"modal\">\n" +
                    "            <span onclick=\"document.getElementById('rekisteroidy').style.display='none'\" class=\"close\" title=\"Sulje\">&times;</span>\n" +
                    "            <form class=\"modal-content animate\" action=\"Rekisteroidy\" method=\"POST\">\n" +
                    "                <div class=\"container\">\n" +
                    "                    <label><b>Syötä uusi käyttäjätunnus</b></label>\n" +
                    "                    <input type=\"text\" placeholder=\"Syötä nimimerkki\" name=\"nimi\" required>\n" +
                    "                    <label><b>Syötä uusi salasana</b></label>\n" +
                    "                    <input type=\"password\" placeholder=\"Syötä salasana\" name=\"salasana\" required>\n" +
                    "                    <label><b>Syötä salasana uudelleen</b></label>\n" +
                    "                    <input type=\"password\" placeholder=\"Syötä salasana\" name=\"salasanab\" required>\n" +
                    "                    <input type=\"checkbox\" checked=\"checked\"> Hyväksyn käyttöehdot\n" +
                    "                    <p>Rekisteröitymällä hyväksyt käyttöehdot <a href=\"KayttoEhdot.jsp\">Käyttäjäehdot</a></p>\n" +
                    "                    <div class=\"clearfix\">\n" +
                    "                        <button type=\"button\" onclick=\"document.getElementById('rekisteroidy').style.display='none'\" class=\"cancelbtn\">Peruuta</button>\n" +
                    "                        <button type=\"submit\" class=\"signupbtn\">Rekisteröidy</button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "\n" +
                    "        </div>\n" +
                    "    </li>");
        }
    %>
    <%
        if (nimi!=null){
            out.print("<li><button><a href=\"/Profiili.jsp\">Profiili</a></button></li>\n");
            out.print("<li><button><a href=\"/UlosServlet\">Kirjaudu ulos</a></button></li>\n");
        }
    %>
    <li class="hakupalkki">
        <form id="x" action="EtsiViesteja" method="get">
            <input type="submit" class="hae" value="Hae"><p>   </p>
            <input type="text" name="etsiviesti" placeholder="Etsi.."></form>
    </li>
</ul>
<body>
<p><img src="kuutamolla.fi.png" width="600px" align="left"><br></p>
<h1 style="clear: both;">Käyttöehdot</h1>
<div class="keskel">
<p style="clear: both;">    Rekisteröitymällä tälle sivulle hyväksyt nämä oheiset käyttöehdot. Luovutat oikeudet kaikkiin henkilötietoihisi. Rekisteröitymismaksu ja niiden postikulut maksetaan tilattaessa. Hinta on yhteensä 149 euroa. Sivullamme voidaan maksaa verkkopankissa seuraavien pankkien kautta: Osuuspankki, Sampo, Nordea, Tapiola, Aktia, Nooa, Paikallisosuuspankit, Säästöpankit, Handelsbanken, S-Pankki ja Ålandsbanken käyvät maksutapana. Toimitamme tilauksia myös postiennakolla.

    Tuotteet postitetaan 3-14 arkipäivän kuluessa tilauksesta. Jos jokin tuote on tilapäisesti loppunut, ilmoitamme siitä asiakkaalle. Mikäli jotakin tuotetta ei tilapäisesti ole lainkaan saatavana, asiasta ilmoitetaan verkkosivullamme. Näitäkin tuotteita voi silti tiedustella, koska uusi erä saattaa olla valmistumassa. Ennakkoon maksetut tuotteet toimitetaan heti, kun olemme saaneet niitä varastoomme. Pyrimme pitämään varastotilanteen ajantasalla mahdollisuuksiemme mukaan.

    Jos maksettuja tuotteita ei ole tilaushetkellä varastossa, eikä asiakas halua jäädä odottamaan tuotteiden saapumista varastoomme, palautamme maksun kokonaisuudessaan asiakkaalle 14 vuorokauden kuluessa.
    Asiakas saa lähetyksen mukana lähetyslistan, joka toimii kuittina ostoksesta sekä takuutodistuksena.

    Voit myös seurata tilauksen etenemistä tilausseurannan kautta. Kun toimitus on “lähetetty” –tilassa, on toimitus postitettu. Postin lähetystunnuksen saat sähköpostiisi tai puhelimeesi kun paketti on saapunut postitoimipaikkaasi.
   Tilausjärjestelmän ulkopuolelta tehtyjä tilauksia ei pysty seuraamaan.</p>

    <h3 style="clear: both;">TAKUU</h3>

    <p style="clear: both;">Saamasi kuitti toimii takuutodistuksena ja se tulee säilyttää. Tuotteidemme takuu on voimassa 10 sekuntia. Takuuaika alkaa toimituspäivästä. Takuupalautukset vain takuukuittia tai laskua vastaan. Mahdollisista vioista on ilmoitettava välittömästi osoitteeseen asiakaspalvelu@rowaspro.com.

    Sivuston ongelmat ei pidennä takuuaikaa. Viallinen tuote korjataan tai vaihdetaan ainoastaan samanlaiseen uuteen tuotteeseen. Takuukorjaus ei pidennä takuuaikaa, vaan takuu jatkuu alkuperäisen takuukauden päättymiseen saakka. Takuunantaja vastaa siitä, että tavaran käyttökelpoisuus ja laatu säilyvät normaaleina takuuajan, kun tuotetta on käytetty käyttöohjeen mukaan.

    Takuunantaja ei kuitenkaan vastaa virheestä, jos se osoittaa todennäköiseksi, että tavaran laadun huonontuminen tai käyttökelpoisuuden väheneminen johtuu tavaran vääränlaisesta käsittelystä, virheellisestä säädöstä, huollosta tai korjauksesta tai muusta ostajasta johtuvasta seikasta, kuten tuotteen käyttöön liittymättömästä onnettomuudesta tai tapaturmasta. Takuunantaja ei myöskään vastaa normaalista käytöstä ja kulumisesta aiheutuvista kustannuksista.

    Ennen takuupalautusta, ota meihin yhteyttä asiakaspalvelu@kuutamolla.com ja kuvaile havaittu vika mahdollisimman tarkasti. Takuuviasta tulee ilmoittaa kohtuullisen ajan sisällä virheen havaitsemisesta, tai kun sinun olisi pitänyt havaita se.

    Otamme pikimmiten yhteyttä jatkotoimenpiteistä takuuhuoltoon liittyen.
    Aiheettomasta takuupalautuksista perimme toimituskulun, sekä huoltomaksun ja mahdolliset muut kustannukset.

    Emme vastaa vaurioista, jotka syntyvät puutteellisesti paketoiduista takuupalautuksista. Emme myöskään lunasta postiin postiennakolla lähetettyjä takuupalautuksia.

    Kuluttajalla on oikeus saattaa takuuehtoja koskeva riita kuluttajanvalituslautakunnan käsittelyyn. Mikäli riita saatetaan tuomioistuimen ratkaistavaksi, se voidaan käsitellä joko kuluttajan tai myyjän kotipaikan käräjäoikeudessa. Takuu ei rajoita niitä oikeuksia, jotka ostajalla kuluttajansuojalain 5 luvun mukaan on virheen perusteella. Takuuvaihtoon tulee liittää riittävän tarkka selostus viasta ja jos mahdollista vian syntyyn vaikuttaneista tapahtumista sekä kopio laskusta.

    TOIMITUSTAVAT

    Tilaukset toimitamme pääosin postin kautta. Pidätämme oikeuden muuttaa toimitustapaa. Muistakin toimitustavoista voidaan sopia tarpeen mukaan. Sopiminen edellyttää yhteydenottoa asiakaspalveluumme, joka toimittaa ennen lähetystä tilausvahvistuksen, jossa toimitustapa ilmoitetaan.
    </p>
    <h3>PALAUTUSOIKEUS</h3>
    <p style="clear: both;">
    Asiakkaan rekisteröitymisellä ja maksulla on täysi 14 sekunnin vaihto- ja palautusoikeus. Palautettavan tuotteen pitää olla täysin käyttämätön ja palautettu alkuperäisessä pakkauksessa. Tuotteen ja pakkauksen tulee olla siinä kunnossa kuin se on meiltä lähtenyt, kuiva ja tahraton, myyntikuntoinen.

    Asiakkaalla on lupa kokeilla tuotteen yhteensopivuutta ajoneuvoonsa, mutta mahdolliset rasva- tai muut tahrat tulee poistaa ennen uudelleenpakkausta. Mikäli tuotetta on selkeästi käytetty ja se on kulunut, vioittunut tai muuten menettänyt myyntikelpoisuutensa, voidaan palautusoikeus evätä.

    Mikäli asiakas haluaa palauttaa tuotteen, hänen tulee ottaa meihin yhteyttä sähköpostitse: asiakaspalvelu@rowaspro.com. Tällöin sovimme asiakkaan kanssa palautuksen yksityiskohdista. Edellä mainittu koskee palautuksen lisäksi myös tuotteen vaihtoa. Pakkauksen mukana tulee palautuslomake, jonka avulla tuotteen voi palauttaa maksutta.

    Palautettava tuote on pakattava yhtä hyvin kuin se oli saapuessaan meiltä. Palautukseen tulee liittää myös kaikki tuotteen mukana tulleet dokumentit, työkalut jne. Postin tarrat voidaan liimata myyntipakkaukseen. Rowaspro ei korvaa palautuksesta aiheutuneita kuluja, ellei palautuksesta ole sovittu etukäteen.

    Erikseen asiakkaalle tilatuilla (TILAUSTUOTE) tuotteilla ei ole palautusoikeutta. Palautusoikeus ei koske yrityksiä, ellei asiasta ole erikseen sovittu ja tilausvahvistukseen kirjattu. Palautuslähetyksen voit jättää kuljetettavaksi postitoimipaikkaan “Asiakaspalautus” HUOM! Emme lunasta postiennakolla lähetettyjä palautuksia.
    </p>
    <h3>KULJETUSVAURIOT</h3>
<p style="clear: both;">
    Kuljetuksessa vaurioituneet lähetykset: On mahdollista että tavara vaurioituu kuljetuksen aikana. Tämän takia on hyvä lähetystä noudettaessa tarkistaa paketin kunto ja mahdolliset vauriot. Mikäli lähetys on vaurioitunut kuljetuksessa, tee siitä heti vahinkoilmoitus postiin. Ota myös yhteys meihin, niin sovimme mahdollisen uuden tuotteen toimituksesta. Jos tuote on rikottu tahallisesti, ylikormitettu tai sitä on muuten käytetty käyttöohjeen vastaisesti, emme katso olevamme korvausvelvollisia.

    <h3>NOUTAMATTOMAT LÄHETYKSET</h3>
    <p style="clear: both;">

    Pidätämme oikeuden veloittaa lunastamattomista postiennakkopaketeista aiheutuneet käsittely ja toimituskulut (Lähetys + palautuskulut). Laskutamme kulut laskulla jälkikäteen

    Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.

    Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    </p>
    <h3> Sopimuksen purku</h3>
    <p style="clear: both;">
        Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    <br></br>Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    Kuu on vuorovesilukkiutunut Maan kanssa. Tämä tarkoittaa, että Kuusta on kääntynyt Maahan päin aina sama puoli, jolloin ns. Kuun pimeä puoli jää aina näkymättömiin. Kuu heijastaa Auringon valoa, ja on taivaan toiseksi kirkkain kohde Auringon jälkeen. Noin kuukaudessa Kuu käy läpi säännölliset vaiheet uusikuusta puolikuun kautta täysikuuhun. Erityisesti tämä on tehnyt Kuusta tärkeän kulttuurillisen ikonin, jolla on ollut suuri vaikutus eri kansojen ajanmittaukseen, kieleen, mytologiaan ja taiteeseen.
    Kuun uskotaan syntyneen samoihin aikoihin kuin Maankin, lähes 4,5 miljardia vuotta sitten. Synnystä on esitetty useita erilaisia teorioita, joista suosituin on törmäyshypoteesi. Törmäyshypoteesin mukaan nuoreen Maahan törmäsi noin planeetta Marsin kokoinen kohde, protoplaneetta Theia. Törmäyksessä Maan kiertoradalle jääneestä materiaalista muodostui Kuu.
    Kuu on ainoa vieras taivaankappale, jonka pinnalla ihminen on kävellyt. Ensimmäinen miehittämätön luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.Kuu (symboli: ☽) on Maan ainoa luonnollinen kiertolainen ja aurinkokunnan viidenneksi suurin kuu. Sen säde vastaa 27 prosentia Maan säteestä, mikä tekee siitä aurinkokunnan suhteessa emoplaneettaansa suurimman kuun. Kuun massa vastaa 1,2 prosenttia ja tiheys 61 prosenttia Maan vastaavasta. Se kiertää Maata keskimäärin noin 384 400 kilometrin etäisyydellä.[3]
    n luotain laskeutui Kuun pinnalle vuonna 1959, ja vuosina 1969–1972 sinne suuntautui kuusi miehitettyä avaruuslentoa, joista ensimmäinen oli Apollo 11. Vuoden 1972 jälkeen Kuussa on vieraillut vain tieteellistä työtä tekeviä miehittämättömiä luotaimia.
</p>
</div>
</body>
</html>
