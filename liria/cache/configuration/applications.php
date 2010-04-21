<?php
return array (
  'settings' => 
  array (
    'liria' => 
    array (
      'path' => false,
      'classes' => 
      array (
        0 => 'madTestRunner',
      ),
      'configPaths' => 
      array (
        0 => '../',
      ),
    ),
    'recipe' => 
    array (
      'routePrefix' => '/recipe',
      'path' => '../recipe',
      'classes' => 
      array (
        0 => 'madRecipeController',
      ),
    ),
    'profile' => 
    array (
      'routePrefix' => '/profile',
    ),
    'ci' => 
    array (
      'routePrefix' => '/ci',
      'path' => '../mad/ci',
      'classes' => 
      array (
        0 => 'madCiController',
        1 => 'madCiTestCase',
        2 => 'madTestRunner',
      ),
    ),
    'mad' => 
    array (
      'path' => '../mad',
      'classes' => 
      array (
        0 => 'madRoute',
        1 => 'madObject',
        2 => 'madModelController',
        3 => 'madDownloadController',
        4 => 'madFatalController',
        5 => 'madModel',
        6 => 'madRegistry',
        7 => 'madView',
        8 => 'madRoutingInformation',
        9 => 'madViewHandler',
        10 => 'ezcTestConstraintSimilarImage',
        11 => 'ezcTestRegressionTest',
        12 => 'ezcTestSettings',
        13 => 'ezcTestRunner',
        14 => 'ezcTestPrinter',
        15 => 'ezcTestDatabaseSettings',
        16 => 'ezcTestRegressionSuite',
        17 => 'ezcConfigurationManager',
        18 => 'ezcConfigurationValidationResult',
        19 => 'ezcConfigurationIniItem',
        20 => 'ezcConfigurationValidationItem',
        21 => 'ezcConfiguration',
        22 => 'ezcConfigurationIniReader',
        23 => 'ezcConfigurationIniParser',
        24 => 'ezcConfigurationIniWriter',
        25 => 'ezcConfigurationUnknownConfigException',
        26 => 'ezcConfigurationWriteFailedException',
        27 => 'ezcConfigurationSettingWrongTypeException',
        28 => 'ezcConfigurationNoConfigException',
        29 => 'ezcConfigurationInvalidReaderClassException',
        30 => 'ezcConfigurationReadFailedException',
        31 => 'ezcConfigurationGroupExistsAlreadyException',
        32 => 'ezcConfigurationUnknownSettingException',
        33 => 'ezcConfigurationNoConfigObjectException',
        34 => 'ezcConfigurationManagerNotInitializedException',
        35 => 'ezcConfigurationUnknownGroupException',
        36 => 'ezcConfigurationSettingnameNotStringException',
        37 => 'ezcConfigurationInvalidSuffixException',
        38 => 'ezcConfigurationParseErrorException',
        39 => 'ezcConfigurationArrayWriter',
        40 => 'ezcConfigurationArrayReader',
        41 => 'ezcMvcRailsRoute',
        42 => 'ezcMvcRegexpRoute',
        43 => 'ezcMvcCatchAllRoute',
        44 => 'ezcMvcResultCookie',
        45 => 'ezcMvcHttpRawRequest',
        46 => 'ezcMvcResultContent',
        47 => 'ezcMvcRequestUserAgent',
        48 => 'ezcMvcInternalRedirect',
        49 => 'ezcMvcRequest',
        50 => 'ezcMvcRoutingInformation',
        51 => 'ezcMvcResultCache',
        52 => 'ezcMvcResponse',
        53 => 'ezcMvcResult',
        54 => 'ezcMvcRequestAccept',
        55 => 'ezcMvcFilterDefinition',
        56 => 'ezcMvcResultContentDisposition',
        57 => 'ezcMvcRequestAuthentication',
        58 => 'ezcMvcRequestCookie',
        59 => 'ezcMvcRequestFile',
        60 => 'ezcMvcHttpRequestParser',
        61 => 'ezcMvcExternalRedirect',
        62 => 'ezcMvcResultUnauthorized',
        63 => 'ezcMvcGzipResponseFilter',
        64 => 'ezcMvcRecodeResponseFilter',
        65 => 'ezcMvcGzDeflateResponseFilter',
        66 => 'ezcMvcHttpResponseWriter',
        67 => 'ezcMvcJsonViewHandler',
        68 => 'ezcMvcPhpViewHandler',
        69 => 'ezcMvcConfigurableDispatcher',
        70 => 'ezcMvcControllerException',
        71 => 'ezcMvcNamedRouteNotReversableException',
        72 => 'ezcMvcFilterHasNoOptionsException',
        73 => 'ezcMvcInfiniteLoopException',
        74 => 'ezcMvcRegexpRouteException',
        75 => 'ezcMvcNamedRouteNotFoundException',
        76 => 'ezcMvcActionNotFoundException',
        77 => 'ezcMvcInvalidConfiguration',
        78 => 'ezcMvcMissingRouteArgumentException',
        79 => 'ezcMvcFatalErrorLoopException',
        80 => 'ezcMvcNoZonesException',
        81 => 'ezcMvcInvalidEncodingException',
        82 => 'ezcMvcNoRoutesException',
        83 => 'ezcMvcRouteNotFoundException',
        84 => 'ezcBaseMetaData',
        85 => 'ezcBaseFile',
        86 => 'ezcBaseStruct',
        87 => 'ezcBaseMetaDataPearReader',
        88 => 'ezcBaseMetaDataTarballReader',
        89 => 'ezcBaseInit',
        90 => 'ezcBaseRepositoryDirectory',
        91 => 'ezcBaseFileFindContext',
        92 => 'ezcBaseFeatures',
        93 => 'ezcBaseAutoloadOptions',
        94 => 'ezcBaseFileIoException',
        95 => 'ezcBaseInitCallbackConfiguredException',
        96 => 'ezcBaseAutoloadException',
        97 => 'ezcBaseWhateverException',
        98 => 'ezcBaseFunctionalityNotSupportedException',
        99 => 'ezcBaseFileNotFoundException',
        100 => 'ezcBaseExtensionNotFoundException',
        101 => 'ezcBaseDoubleClassRepositoryPrefixException',
        102 => 'ezcBasePropertyNotFoundException',
        103 => 'ezcBaseSettingNotFoundException',
        104 => 'ezcBaseInvalidParentClassException',
        105 => 'ezcBaseSettingValueException',
        106 => 'ezcBaseValueException',
        107 => 'ezcBaseInitInvalidCallbackClassException',
        108 => 'ezcBasePropertyPermissionException',
        109 => 'ezcBaseFilePermissionException',
        110 => 'ezcBase',
        111 => 'madCiController',
        112 => 'madCiTestCase',
        113 => 'madTestRunner',
        114 => 'madObjectException',
        115 => 'madObjectValueException',
        116 => 'madObjectPropertyNotFoundException',
        117 => 'madObjectMixedKeysException',
        118 => 'madModelException',
        119 => 'madModelExceptedId',
        120 => 'madConfiguration',
        121 => 'madRouter',
      ),
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
