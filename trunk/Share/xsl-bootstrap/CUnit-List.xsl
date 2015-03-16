<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="CUNIT_TEST_LIST_REPORT">
    <html>
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>CUnit - Suite and Test Case Organization in Test Registry</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      </head>
      <body>
        <xsl:apply-templates />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery-1.11.2.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="CUNIT_HEADER">
    <div class="page-header">
      <h3 class="text-center">
        <b>CUnit - A Unit testing framework for C.</b>
        <br />
        <a href="http://cunit.sourceforge.net/">http://cunit.sourceforge.net/</a>
      </h3>
    </div>
  </xsl:template>
  <xsl:template match="CUNIT_LIST_TOTAL_SUMMARY">
    <p />
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">Summary</h4>
      </div>
      <div class="panel-body">
        <table class="table">
          <xsl:apply-templates />
        </table>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="CUNIT_LIST_TOTAL_SUMMARY_RECORD">
    <tr>
      <td width="70%">
        <xsl:value-of select="CUNIT_LIST_TOTAL_SUMMARY_RECORD_TEXT" />
      </td>
      <td align="center">
        <xsl:value-of select="CUNIT_LIST_TOTAL_SUMMARY_RECORD_VALUE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4>Listing of Registered Suites &amp; Tests</h4>
      </div>
      <div class="panel-body">
        <table class="table">
          <tr>
            <th colspan="2"></th>
            <th align="center">
              <b>Initialize Function?</b>
            </th>
            <th align="center">
              <b>Cleanup Function?</b>
            </th>
            <th align="center">
              <b>Test Count</b>
            </th>
            <th align="center">
              <b>Active?</b>
            </th>
          </tr>
          <xsl:apply-templates />
        </table>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_SUITE">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_SUITE_DEFINITION">
    <tr>
      <td colspan="8"></td>
    </tr>
    <tr>
      <td align="left">Suite</td>
      <td align="left">
        <b>
          <xsl:value-of select="SUITE_NAME" />
        </b>
      </td>
      <td align="center">
        <xsl:value-of select="INITIALIZE_VALUE" />
      </td>
      <td align="center">
        <xsl:value-of select="CLEANUP_VALUE" />
      </td>
      <td align="center">
        <xsl:value-of select="TEST_COUNT_VALUE" />
      </td>
      <td align="center">
        <xsl:value-of select="ACTIVE_VALUE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_SUITE_TESTS">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="TEST_CASE_DEFINITION">
    <tr>
      <td align="center">Test</td>
      <td align="left" colspan="4">
        <xsl:value-of select="TEST_CASE_NAME" />
      </td>
      <td align="center">
        <xsl:value-of select="TEST_ACTIVE_VALUE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_GROUP">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_GROUP_DEFINITION">
    <tr>
      <td width="10%">Suite</td>
      <td width="20%">
        <b>
          <xsl:value-of select="GROUP_NAME" />
        </b>
      </td>
      <td width="15%">Initialize Function?</td>
      <td width="5%">
        <xsl:value-of select="INITIALIZE_VALUE" />
      </td>
      <td width="15%">Cleanup Function?</td>
      <td width="5%">
        <xsl:value-of select="CLEANUP_VALUE" />
      </td>
      <td width="10%">Test Count</td>
      <td width="5%">
        <xsl:value-of select="TEST_COUNT_VALUE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_ALL_TEST_LISTING_GROUP_TESTS">
    <tr>
      <td align="center">Test Cases</td>
      <td align="left" colspan="7">
        <xsl:for-each select="TEST_CASE_NAME">
          <xsl:apply-templates />
          <br />
        </xsl:for-each>
      </td>
    </tr>
    <tr>
      <td colspan="8"></td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_FOOTER">
    <p />
    <h5 align="center">
      <xsl:apply-templates />
    </h5>
  </xsl:template>
</xsl:stylesheet>
