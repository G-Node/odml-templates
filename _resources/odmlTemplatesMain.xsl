<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
                xmlns:odml="http://www.g-node.org/odml">
  <!-- ************************************************  -->
  <!--                   root template                   -->
  <xsl:template match="odML">
    <html>
      <style type="text/css">
        <link href="https://templates.g-node.org/resources/odMLIcon.ico" rel="shortcut icon"
              csoptsettings="AQAAAD142mNgYNBomeIwObe4IIeBgYEvyTDuaAoPw3IFiwOcndS8HR1NjO0NDPTNdIzzEzOByni+A8EQNoAAPMPEQ4="
              livesrc="https://templates.g-node.org/resources/odMLIcon.png" />
        body { margin:0; padding:0; height:1500px; } div { border:0px
        solid #888; }
        #contentContainer {position:absolute; left:251px; top:1px; width:80%;
        height:auto;}
      </style>
      <body>
        <p><a href="index.html"><img src="https://templates.g-node.org/resources/odMLTitle.png" alt="" title="Home" height="128" width="707" border="0" /></a></p>
        <h1>odML - Templates</h1>
        <p>This repository contains re-usable odML templates. A general introduction to
           odML and its usage can be found at the <a href="http://www.g-node.org/odml" rel="nofollow">main odML page</a>.
           A brief introduction can be found at the bottom of the page.</p>
        <p>If you would like to contribute and provide a new template to be shared with
           the community, please open an issue or even create a Pull Request with your
           template on the corresponding <a href="https://github.com/G-Node/odml-templates" rel="nofollow">
            github repository</a>.</p>

        <ol>
          <xsl:if test="section">
            <xsl:for-each select="section"><br/>
              <xsl:call-template name="sectionTemplate"/>
            </xsl:for-each>
          </xsl:if>
        </ol>

        <h2>A brief introduction to odML and metadata</h2>
        <p>odML (open metadata Markup Language) is a framework, proposed by
        <a href="http://journal.frontiersin.org/article/10.3389/fninf.2011.00016/full" rel="nofollow">Grewe et al. (2011)</a>,
          to organize and store experimental metadata in a human- and machine-readable,
          XML based format (odml). In this tutorial we will illustrate the conceptual
          design of the odML framework and show hands-on how you can generate your own
          odML metadata file collection. A well organized metadata management of your
          experiment is a key component to guarantee the reproducibility of your research
          and facilitate the provenance tracking of your analysis projects.</p>

        <h3>What are metadata and why are they needed?</h3>
        <p>Metadata are data about data. They describe the conditions under which the
        actual raw-data of an experimental study were acquired. The organization of
        such metadata and their accessibility may sound like a trivial task, and
        most laboratories developed their home-made solutions to keep track of
        their metadata. Most of these solutions, however, break down if data and
        metadata need to be shared within a collaboration, because implicit
        knowledge of what is important and how it is organized is often
        underestimated.</p>
        <p>While maintaining the relation to the actual raw-data, odML can help to
        collect all metadata which are usually distributed over several files and
        formats, and to store them unitedly which facilitates sharing data and
        metadata.</p>

        <h3>Key features of odML</h3>
        <ul>
          <li>open, XML based language, to collect, store and share metadata</li>
          <li>Machine- and human-readable</li>
          <li>Python-odML library</li>
          <li>Interactive odML-Editor</li>
        </ul>
      </body>
    </html>
  </xsl:template>

  <!-- ************************************************  -->
  <!--              section template.                    -->
  <xsl:template name="sectionTemplate" match="section">
    <!--create the list item -->
    <xsl:variable name="linkurl" select="include"/>
    <li>
      <a  href="{$linkurl}"><xsl:value-of select="concat(type,' - type, name: ',name)"/></a><br/>
      <ul>
        <xsl:for-each select="section">
          <xsl:call-template name="sectionTemplate"/>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>

</xsl:stylesheet>
