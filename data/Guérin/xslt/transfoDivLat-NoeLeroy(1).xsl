<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" />

    
    <xsl:template match="/">
            <xsl:element name="teiCorpus">
                <xsl:apply-templates />
            </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <xsl:element name="TEI">
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
       <xsl:copy>
           <xsl:apply-templates select="@*|node()"/>
       </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@*|node()[ancestor::tei:teiHeader]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:text[not(descendant::tei:div[@xml:lang='lat'])]"/>
        
       
    <xsl:template match="tei:text[descendant::tei:div[@xml:lang='lat']]">
        <xsl:element name="text">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:front"/>
    
    <xsl:template match="tei:group">
        <xsl:element name="group">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:head[parent::tei:group]">
        <xsl:element name="head">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
       
    
    <xsl:template match="tei:body">
        <xsl:element name="body">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:lang='lat']">        
        <xsl:element name="div">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="tei:p[parent::tei:div[@xml:lang='lat']]">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="tei:quote[@xml:lang='lat']">
        <xsl:element name="quote">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:lang='fro'] | tei:note | tei:app |tei:quote[@xml:lang='fro']"/>
        
    
    <xsl:template match="tei:choice|tei:expan|tei:ex">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:abbr|tei:am"/>
    
    <xsl:template match="tei:hi">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!-- remove comments -->
    <xsl:template match="comment()"/>
    

    
</xsl:stylesheet>

