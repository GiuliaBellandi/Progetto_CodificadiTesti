<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tei="http://www.tei-c.org/ns/1.0"
      xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="tei:teiCorpus">
    <html>
      <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script src="http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script src="mainJQ.js" type="text/javascript" />
      </head>
      <body>

        <img src="info.png" id="i" alt="info" />
        <h2><xsl:value-of select="tei:teiHeader//tei:sourceDesc/tei:bibl/tei:interp"/></h2> <!--riprendere il titolo dal main-->

        <div id="testoInfo">
            <p><xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:titleStmt/tei:respStmt" /></p>
            <xsl:for-each select="tei:teiHeader[@xml:id='list']//tei:editionStmt/tei:respStmt">
               <p><xsl:value-of select="." /></p>
            </xsl:for-each>
            <p>Pubblicato da:<xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:publisher" /></p>
            <p>Distribuito da: <xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:distributor/tei:choice/tei:expan" /></p>
            <i><xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:availability" /></i>
        </div>

    <xsl:for-each select="tei:TEI" >
        <xsl:variable name="id" select="@xml:id" />

        <h2><xsl:value-of select="tei:teiHeader/tei:fileDesc/*/tei:bibl/tei:title" /></h2>

        <div class="right">   <!--div di destra che contiene il testo-->

    <!--      <div id="tools">
            <button id="butInfo" type="button" >Info</button>
            <button id="butCont" type="button" >Contenuti</button>
          </div> -->

          <div id="infoF">

            <h3>Informazioni sull'opera d'arte</h3>
            <p>Titolo: <xsl:value-of select="tei:teiHeader//tei:bibl/tei:title" /></p>
            <p>Autore: <xsl:value-of select="tei:teiHeader//tei:support/tei:p/tei:persName" /></p>
            <xsl:for-each select="tei:teiHeader//tei:textClass/tei:keywords/tei:term">
              <xsl:if test="position() > 2">
               <p>Descrizione: <xsl:value-of select="." /></p>
              </xsl:if>
            </xsl:for-each>
            <h3>Informazioni identificative della cartolina</h3>
            <p>Editore:
              <xsl:choose>
                <xsl:when test="tei:teiHeader//tei:bibl/tei:publisher/tei:persName">
                    <xsl:value-of select="tei:teiHeader//tei:bibl/tei:publisher/tei:persName" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="tei:teiHeader//tei:bibl/tei:publisher/tei:orgName" />
                </xsl:otherwise>
              </xsl:choose>
            </p>
            <p>Dimensioni: <xsl:value-of select="tei:teiHeader//tei:support/tei:dimensions/tei:height" />x<xsl:value-of select="//tei:support/tei:dimensions/tei:width" /><xsl:value-of select="//tei:support/tei:dimensions/@unit" /></p>
            <h3>Informazioni generali</h3>
            <p>
              <xsl:value-of select="tei:teiHeader//tei:support/tei:p" />
            </p>
            <i>Cartolina conservata al <xsl:value-of select="tei:teiHeader//tei:msIdentifier/tei:repository" />, <xsl:value-of select="//tei:TEI[@xml:id='cart7694-084']//tei:msIdentifier/tei:settlement" /></i>
          </div>

          <div id="contenutiF">

            <h3>Descrizione contenuti immagine:</h3>
            <xsl:for-each select="tei:text//tei:figDesc">
              <p>
                <xsl:value-of select="." />
              </p>
            </xsl:for-each>
          </div>

          <div id="infoR">

            <h3>Informazioni mittente</h3>
            <p>Nome: <xsl:value-of select="tei:teiHeader//tei:correspAction[@type='sent']/tei:persName" /></p>
            <p>Luogo: <xsl:value-of select="tei:teiHeader//tei:correspAction[@type='sent']/tei:placeName" /></p>
            <p>Data: <xsl:value-of select="/tei:teiHeader/tei:correspAction[@type='sent']/tei:date[@type='writing']" /></p>
            <h3>Informazioni destinatario</h3>
            <p>Nome: <xsl:value-of select="tei:teiHeader//tei:correspAction[@type='received']/tei:persName" /></p>
            <p>Luogo: <xsl:value-of select="tei:teiHeader//tei:correspAction[@type='received']/tei:placeName" /></p>
            <h3>Informazioni corrispondenza</h3>
            <p><xsl:value-of select="tei:teiHeader//tei:support/tei:stamp[@type='postage']" /></p>
            <xsl:for-each select="tei:teiHeader//tei:support/tei:stamp[@type='postmark']">
            <p>  <xsl:value-of select="." /></p>
            </xsl:for-each>

          </div>

          <div id="contenutiR">

              <p><xsl:value-of select="tei:text//tei:opener/tei:dateline/tei:s" /></p>
              <p>
                <xsl:for-each select="tei:text//tei:div[@type='postcard-body']/tei:p/tei:s" >

                             <xsl:value-of select=". | *" />

                </xsl:for-each>
              </p>

              <p><xsl:value-of select="tei:text//tei:closer/tei:signed" /></p>

              <br />
              <i><xsl:value-of select="tei:text//tei:front/tei:div[@type='print']/tei:p" /></i>

               <p>-------------------------------------------------------</p>

               <p><xsl:value-of select="tei:text//tei:back//tei:num" /></p>

              <p>
                <xsl:value-of select="tei:text//tei:stamp[@type='postage']/tei:mentioned" />
              </p>

              <p>
                <xsl:for-each select="tei:text//tei:stamp[@type='postmark']/tei:mentioned" >
                              <xsl:value-of select="." />
                              <br />
                </xsl:for-each>
              </p>

              <p>
                <xsl:for-each select="tei:text//tei:div[@type='address-destination']/tei:ab/tei:address/tei:addrLine" >
                  <xsl:for-each select="text()|*">
                    <xsl:choose>
                      <xsl:when test="self::tei:choice">
                        <xsl:value-of select="tei:abbr" />
                      </xsl:when>

                      <xsl:when test="self::text()|self::*">
                        <xsl:value-of select="." />
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <br />
                </xsl:for-each>
              </p>
          </div>
        </div>

        <div class="left">  <!--div di sinistra che contiene la cartolina-->

    <!--      <div id="tools">
            <select>
              <option id="fronte" selected="selected" value="{$id}F">Fronte</option>
              <option id="retro" value="{$id}R">Retro</option>
            </select>
          </div> -->

          <div id="CimgC">
            <div id="imgC">
              <img id="foto" src="{$id}F.jpg" alt="cartolinaFronte" ></img>
              <img id="foto" src="{$id}R.jpg" alt="cartolinaFronte" ></img>
            </div>
          </div>

        </div>

      </xsl:for-each>


        <footer>
          <h3> Progetto realizzato per il corso di Codifica di Testi, a. a. 2020/2021 da:</h3>
          <h3>
            <xsl:for-each select="tei:teiHeader[@xml:id='list']//tei:titleStmt//tei:persName">
              <xsl:value-of select="." />
              <br />
            </xsl:for-each>
          </h3>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
