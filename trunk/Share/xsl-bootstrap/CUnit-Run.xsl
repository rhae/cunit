<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="CUNIT_TEST_RUN_REPORT">
    <html>
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>CUnit - Automated Test Run Summary Report</title>
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
        <xsl:apply-templates select="CUNIT_HEADER" />
        <xsl:apply-templates select="CUNIT_RUN_SUMMARY" />
        <xsl:apply-templates select="CUNIT_RESULT_LISTING" />
        <xsl:apply-templates select="CUNIT_FOOTER" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="jquery/jquery-1.11.2.min.js"></script>
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
  <xsl:template match="CUNIT_RESULT_LISTING">
    <p />
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">Automated Test Run Results</h4>
      </div>
      <div class="panel-body">
        <table class="table">
          <xsl:apply-templates />
        </table>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_SUITE">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="SUITE_NAME"></xsl:template>
  <xsl:template match="CUNIT_RUN_SUITE_SUCCESS">
    <tr>
      <td colspan="4">Running Suite 
      <xsl:value-of select="SUITE_NAME" /></td>
    </tr>
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="CUNIT_RUN_GROUP">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="CUNIT_RUN_GROUP_SUCCESS">
    <tr>
      <td colspan="4">Running Group 
      <xsl:apply-templates /></td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_TEST_RECORD">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="CUNIT_RUN_TEST_SUCCESS">
    <tr>
      <td></td>
      <td colspan="2">Running test 
      <xsl:apply-templates />...</td>
      <td>Passed</td>
      <td></td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_TEST_SKIPPED">
    <tr>
      <td></td>
      <td colspan="2">Skipping test 
      <xsl:apply-templates />...</td>
      <td>Skipped</td>
      <td></td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_TEST_FAILURE">
    <tr>
      <td></td>
      <td colspan="2">Running test 
      <xsl:value-of select="TEST_NAME" />...</td>
      <td>
        <p class="text-danger">Failed</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="2">
        <table width="100%">
          <tr>
            <th width="15%">File Name</th>
            <td width="50%">
              <xsl:value-of select="FILE_NAME" />
            </td>
            <th width="20%">Line Number</th>
            <td width="10%">
              <xsl:value-of select="LINE_NUMBER" />
            </td>
          </tr>
          <tr>
            <th width="15%">Condition</th>
            <td colspan="3" width="85%">
              <xsl:value-of select="CONDITION" />
            </td>
          </tr>
        </table>
      </td>
      <td></td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_SUITE_FAILURE">
    <tr>
      <td colspan="3">Running Suite 
      <xsl:value-of select="SUITE_NAME" />...</td>
      <td>
        <xsl:value-of select="FAILURE_REASON" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_GROUP_FAILURE">
    <tr>
      <td colspan="3">Running Group 
      <xsl:value-of select="GROUP_NAME" />...</td>
      <td>
        <xsl:value-of select="FAILURE_REASON" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="CUNIT_RUN_SUMMARY">
    <p />
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">Cumulative Summary for Run</h4>
      </div>
      <div class="panel-body">
        <table class="table">
          <tr width="80%">
            <th>Type</th>
            <th>Total</th>
            <th>Run</th>
            <th>Succeeded</th>
            <th>Failed</th>
            <th>Inactive</th>
          </tr>
          <xsl:for-each select="CUNIT_RUN_SUMMARY_RECORD">
            <tr width="80%">
              <td>
                <xsl:value-of select="TYPE" />
              </td>
              <td>
                <xsl:value-of select="TOTAL" />
              </td>
              <td>
                <xsl:value-of select="RUN" />
              </td>
              <td>
                <xsl:value-of select="SUCCEEDED" />
              </td>
              <td>
                <xsl:value-of select="FAILED" />
              </td>
              <td>
                <xsl:value-of select="INACTIVE" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="CUNIT_FOOTER">
    <p />
    <hr align="center" width="90%" />
    <h5 align="center">
      <xsl:apply-templates />
    </h5>
  </xsl:template>
</xsl:stylesheet>
