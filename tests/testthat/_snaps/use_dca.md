# use_dca can read variables 

    Code
      res_var[[1]]$children
    Output
      [[1]]
      <style>@import url("https://fonts.googleapis.com/css?family=Lato:300,300italic,400,400italic,500,500italic,700,700italic");
      .dca-remove {
        display: none;
      }
      
      .dca-palette-panel .dca-palette-toggle {
        position: relative;
        display: block;
        padding: 15px;
        color: #fff;
      }
      
      .dca-palette-panel .dca-palette-toggle:hover, .dca-palette-panel .dca-palette-toggle:active, .dca-palette-panel .dca-palette-toggle:focus {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel.open > .dca-palette-toggle {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel #dca-palette-menu {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: absolute;
        right: 0;
        left: auto;
        border: 1px solid #ddd;
        background: #fff;
        color: #444;
        margin-top: 0;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        box-shadow: none;
      }
      
      .dca-palette-panel #dca-palette-menu .header {
        border-bottom: 1px solid #f4f4f4;
        padding: 7px 10px;
      }
      
      .dca-palette-panel #dca-palette-menu .menu {
        padding: 10px;
      }
      
      .dca-palette-panel .shiny-input-container:not(.shiny-input-container-inline) {
        width: 192px;
        margin-bottom: 0;
      }
      
      .colourpicker-panel .colourpicker-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 4px;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer {
        border-color: #f4f4f4;
        border-radius: 50%;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer:hover {
        border-color: orange;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer .cp-list-col {
        border-radius: 50%;
      }
      
      .content-wrapper {
        position: relative;
      }
      
      .dca-footer {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
      }
      
      .dca-footer > * {
        margin-bottom: 8px;
      }
      
      .dca-footer .dca-footer-media {
        display: inline-flex;
        align-items: center;
      }
      
      .dca-footer .dca-footer-media > * {
        margin: 0 8px;
      }
      
      /* Buttons */
      .dca-shiny-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        position: relative;
        background: #27022d !important;
        color: #fff !important;
        background-image: linear-gradient(270deg, #8e9ac2, #42579a) !important;
        background-size: 400% 400% !important;
        overflow: hidden;
        animation: TransitioningBackground 10s ease infinite;
        transition: 500ms !important;
        filter: none !important;
      }
      
      .dca-shiny-btn:hover, .dca-shiny-btn:focus {
        color: #fff;
        background-image: linear-gradient(to left, #2d8fe5, #d155b8) !important;
        transform: scale(1.05);
      }
      
      .dca-shiny-btn::before {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.5);
        width: 60px;
        height: 100%;
        top: 0;
        filter: blur(30px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::after {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.2);
        width: 30px;
        height: 100%;
        top: 0;
        filter: blur(5px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::before, .dca-shiny-btn::after {
        transform: translateX(300px) skewX(-15deg);
        transition: 0.7s;
      }
      
      @keyframes TransitioningBackground {
        0% {
          background-position: 1% 0%;
        }
        50% {
          background-position: 99% 100%;
        }
        100% {
          background-position: 1% 0%;
        }
      }
      
      .dca-left-btn,
      .dca-right-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #fff !important;
        color: #000 !important;
        display: inline-flex !important;
        justify-content: center;
        align-items: center;
        height: 40px !important;
      }
      
      .dca-left-btn:hover, .dca-left-btn:focus,
      .dca-right-btn:hover,
      .dca-right-btn:focus {
        background: #fff;
      }
      
      .dca-left-btn .fa,
      .dca-right-btn .fa {
        margin: 1.5px;
        font-size: 20px;
      }
      
      .dca-left-btn:hover .fa {
        animation: dca-move-left 2s infinite;
      }
      
      .dca-left-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-left-btn:hover .fa:nth-child(1) {
        animation-delay: -0.4s;
      }
      
      .dca-right-btn:hover .fa {
        animation: dca-move-right 2s infinite;
      }
      
      .dca-right-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-right-btn:hover .fa:nth-child(3) {
        animation-delay: -0.4s;
      }
      
      @keyframes dca-move-left {
        0% {
          opacity: 0;
          transform: translateX(10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(-10px);
        }
      }
      
      @keyframes dca-move-right {
        0% {
          opacity: 0;
          transform: translateX(-10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(10px);
        }
      }
      
      .waiter-overlay.waiter-local {
        left: 0 !important;
      }
      
      .waiter-overlay-content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        width: auto !important;
      }
      
      .dca-logo-spin {
        display: inline-block;
        margin: auto;
        width: 3.5em;
        height: 3.5em;
        -webkit-animation: dca-spin 2s infinite linear;
        animation: dca-spin 2s infinite linear;
      }
      
      @-webkit-keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      @keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      body {
        background-color: red;
      }
      
      body h1,
      body h2,
      body h3,
      body h4,
      body h5,
      body span {
        font-family: "Helvetica Neue", "Helvetica", "Arial", "sans-serif";
        color: #444;
      }
      
      .skin-blue .main-header .navbar {
        background: red;
        color: #fff;
      }
      
      .skin-blue .main-header .logo {
        background: red !important;
        color: #fff;
      }
      
      /* sidebar: collapse button hover */
      .skin-blue .main-header .navbar .sidebar-toggle {
        background: red;
        color: #fff;
      }
      
      .skin-blue .main-header .navbar .sidebar-toggle:hover {
        background: red;
        color: #fff;
        opacity: 0.75;
      }
      
      .skin-blue .main-header .logo {
        background: #3c8dbc;
      }
      
      .skin-blue .main-header .logo:hover {
        background: #3c8dbc;
      }
      
      .navbar .sidebar-toggle {
        background: #3c8dbc;
        color: #fff;
      }
      
      .navbar .sidebar-toggle:hover {
        background: #3c8dbc;
        color: #fff;
      }
      
      .skin-blue .main-sidebar {
        background: #222d32 !important;
        color: #b8c7ce;
        box-shadow: 0 0 5px #b3b3b3;
      }
      
      .skin-blue .main-sidebar .sidebar {
        padding-top: 15px;
      }
      
      .skin-blue .main-sidebar .sidebar li > a {
        border-left: unset !important;
        border-radius: 10px;
        margin: 0 14px;
        transition: background-color 100ms ease;
        color: #b8c7ce;
      }
      
      .skin-blue .main-sidebar .sidebar li > a > span {
        color: #b8c7ce !important;
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a, .skin-blue .main-sidebar .sidebar li > a:hover {
        color: #fff !important;
        background: #1e282c;
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a > span, .skin-blue .main-sidebar .sidebar li > a:hover > span {
        color: #fff !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a {
        color: #fff !important;
        background: #1e282c !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a > span {
        color: #fff !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active:hover > a, .skin-blue .main-sidebar .sidebar li.active > a:hover {
        background: #1e282c !important;
        color: #fff !important;
      }
      
      .skin-blue .wrapper {
        background-color: #ecf0f5;
      }
      
      .content-wrapper,
      .right-side {
        background: #ecf0f5;
      }
      
      .content-wrapper a,
      .right-side a {
        color: #3c8dbc !important;
        text-decoration: underline;
      }
      
      .content-wrapper a:hover,
      .right-side a:hover {
        text-decoration: none;
      }
      
      .dca-footer {
        background: #222d32;
        color: #b8c7ce;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-primary {
        border: none;
      }
      
      .box.box-solid.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #3c8dbc;
      }
      
      .box.box-solid.box-primary > .box-header h3 {
        color: #fff;
      }
      
      .box.box-primary {
        border-color: #3c8dbc;
      }
      
      .box.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-primary > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-accent {
        border: none;
      }
      
      .box.box-solid.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #f4f4f4;
      }
      
      .box.box-solid.box-accent > .box-header h3 {
        color: #000;
      }
      
      .box.box-accent {
        border-color: #f4f4f4;
      }
      
      .box.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-accent > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-dark {
        border: none;
      }
      
      .box.box-solid.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-dark > .box-header h3 {
        color: #fff;
      }
      
      .box.box-dark {
        border-color: #000;
      }
      
      .box.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-dark > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-light {
        border: none;
      }
      
      .box.box-solid.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-light > .box-header h3 {
        color: #000;
      }
      
      .box.box-light {
        border-color: #fff;
      }
      
      .box.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-light > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-success {
        border: none;
      }
      
      .box.box-solid.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #00a65a;
      }
      
      .box.box-solid.box-success > .box-header h3 {
        color: #fff;
      }
      
      .box.box-success {
        border-color: #00a65a;
      }
      
      .box.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-success > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-info {
        border: none;
      }
      
      .box.box-solid.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #00c0ef;
      }
      
      .box.box-solid.box-info > .box-header h3 {
        color: #fff;
      }
      
      .box.box-info {
        border-color: #00c0ef;
      }
      
      .box.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-info > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-warning {
        border: none;
      }
      
      .box.box-solid.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #f39c12;
      }
      
      .box.box-solid.box-warning > .box-header h3 {
        color: #fff;
      }
      
      .box.box-warning {
        border-color: #f39c12;
      }
      
      .box.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-warning > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-danger {
        border: none;
      }
      
      .box.box-solid.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #dd4b39;
      }
      
      .box.box-solid.box-danger > .box-header h3 {
        color: #fff;
      }
      
      .box.box-danger {
        border-color: #dd4b39;
      }
      
      .box.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-danger > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-white {
        border: none;
      }
      
      .box.box-solid.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-white > .box-header h3 {
        color: #000;
      }
      
      .box.box-white {
        border-color: #fff;
      }
      
      .box.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-white > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-black {
        border: none;
      }
      
      .box.box-solid.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-black > .box-header h3 {
        color: #fff;
      }
      
      .box.box-black {
        border-color: #000;
      }
      
      .box.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-black > .box-header h3 {
        color: #000;
      }
      
      .btn-default,
      .action-button {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #f4f4f4;
        color: #000;
        filter: grayscale(0%) opacity(1);
        transition: 100ms;
      }
      
      .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default:active:focus, .btn-default:visited,
      .action-button:hover,
      .action-button:focus,
      .action-button:active,
      .action-button:active:focus,
      .action-button:visited {
        background: #f4f4f4;
        color: #000;
        filter: grayscale(20%) opacity(0.7);
      }
      
      .btn-primary,
      .btn-primary:active,
      .btn-primary:visited {
        background: #3c8dbc !important;
        color: #fff !important;
      }
      
      .btn-primary:hover {
        background: #3c8dbc !important;
      }
      
      .btn-accent,
      .btn-accent:active,
      .btn-accent:visited {
        background: #f4f4f4 !important;
        color: #000 !important;
      }
      
      .btn-accent:hover {
        background: #f4f4f4 !important;
      }
      
      .btn-dark,
      .btn-dark:active,
      .btn-dark:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-dark:hover {
        background: #000 !important;
      }
      
      .btn-light,
      .btn-light:active,
      .btn-light:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-light:hover {
        background: #fff !important;
      }
      
      .btn-success,
      .btn-success:active,
      .btn-success:visited {
        background: #00a65a !important;
        color: #fff !important;
      }
      
      .btn-success:hover {
        background: #00a65a !important;
      }
      
      .btn-info,
      .btn-info:active,
      .btn-info:visited {
        background: #00c0ef !important;
        color: #fff !important;
      }
      
      .btn-info:hover {
        background: #00c0ef !important;
      }
      
      .btn-warning,
      .btn-warning:active,
      .btn-warning:visited {
        background: #f39c12 !important;
        color: #fff !important;
      }
      
      .btn-warning:hover {
        background: #f39c12 !important;
      }
      
      .btn-danger,
      .btn-danger:active,
      .btn-danger:visited {
        background: #dd4b39 !important;
        color: #fff !important;
      }
      
      .btn-danger:hover {
        background: #dd4b39 !important;
      }
      
      .btn-white,
      .btn-white:active,
      .btn-white:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-white:hover {
        background: #fff !important;
      }
      
      .btn-black,
      .btn-black:active,
      .btn-black:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-black:hover {
        background: #000 !important;
      }
      
      .waiter-overlay.waiter-local {
        background: #3c8dbc !important;
        color: #444 !important;
      }
      </style>
      
      [[2]]
      <script>
              setTimeout(function() {
                history.pushState({}, 'Data Curator', window.location.pathname);
              }, 2000);
              </script>
      

# use_dca can use predefined theme

    Code
      res_theme[[1]]$children
    Output
      [[1]]
      <style>@import url("https://fonts.googleapis.com/css?family=Lato:300,300italic,400,400italic,500,500italic,700,700italic");
      .dca-remove {
        display: none;
      }
      
      .dca-palette-panel .dca-palette-toggle {
        position: relative;
        display: block;
        padding: 15px;
        color: #fff;
      }
      
      .dca-palette-panel .dca-palette-toggle:hover, .dca-palette-panel .dca-palette-toggle:active, .dca-palette-panel .dca-palette-toggle:focus {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel.open > .dca-palette-toggle {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel #dca-palette-menu {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: absolute;
        right: 0;
        left: auto;
        border: 1px solid #ddd;
        background: #fff;
        color: #444;
        margin-top: 0;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        box-shadow: none;
      }
      
      .dca-palette-panel #dca-palette-menu .header {
        border-bottom: 1px solid #f4f4f4;
        padding: 7px 10px;
      }
      
      .dca-palette-panel #dca-palette-menu .menu {
        padding: 10px;
      }
      
      .dca-palette-panel .shiny-input-container:not(.shiny-input-container-inline) {
        width: 192px;
        margin-bottom: 0;
      }
      
      .colourpicker-panel .colourpicker-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 4px;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer {
        border-color: #f4f4f4;
        border-radius: 50%;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer:hover {
        border-color: orange;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer .cp-list-col {
        border-radius: 50%;
      }
      
      .content-wrapper {
        position: relative;
      }
      
      .dca-footer {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
      }
      
      .dca-footer > * {
        margin-bottom: 8px;
      }
      
      .dca-footer .dca-footer-media {
        display: inline-flex;
        align-items: center;
      }
      
      .dca-footer .dca-footer-media > * {
        margin: 0 8px;
      }
      
      /* Buttons */
      .dca-shiny-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        position: relative;
        background: #27022d !important;
        color: #fff !important;
        background-image: linear-gradient(270deg, #8e9ac2, #42579a) !important;
        background-size: 400% 400% !important;
        overflow: hidden;
        animation: TransitioningBackground 10s ease infinite;
        transition: 500ms !important;
        filter: none !important;
      }
      
      .dca-shiny-btn:hover, .dca-shiny-btn:focus {
        color: #fff;
        background-image: linear-gradient(to left, #2d8fe5, #d155b8) !important;
        transform: scale(1.05);
      }
      
      .dca-shiny-btn::before {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.5);
        width: 60px;
        height: 100%;
        top: 0;
        filter: blur(30px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::after {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.2);
        width: 30px;
        height: 100%;
        top: 0;
        filter: blur(5px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::before, .dca-shiny-btn::after {
        transform: translateX(300px) skewX(-15deg);
        transition: 0.7s;
      }
      
      @keyframes TransitioningBackground {
        0% {
          background-position: 1% 0%;
        }
        50% {
          background-position: 99% 100%;
        }
        100% {
          background-position: 1% 0%;
        }
      }
      
      .dca-left-btn,
      .dca-right-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #fff !important;
        color: #000 !important;
        display: inline-flex !important;
        justify-content: center;
        align-items: center;
        height: 40px !important;
      }
      
      .dca-left-btn:hover, .dca-left-btn:focus,
      .dca-right-btn:hover,
      .dca-right-btn:focus {
        background: #fff;
      }
      
      .dca-left-btn .fa,
      .dca-right-btn .fa {
        margin: 1.5px;
        font-size: 20px;
      }
      
      .dca-left-btn:hover .fa {
        animation: dca-move-left 2s infinite;
      }
      
      .dca-left-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-left-btn:hover .fa:nth-child(1) {
        animation-delay: -0.4s;
      }
      
      .dca-right-btn:hover .fa {
        animation: dca-move-right 2s infinite;
      }
      
      .dca-right-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-right-btn:hover .fa:nth-child(3) {
        animation-delay: -0.4s;
      }
      
      @keyframes dca-move-left {
        0% {
          opacity: 0;
          transform: translateX(10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(-10px);
        }
      }
      
      @keyframes dca-move-right {
        0% {
          opacity: 0;
          transform: translateX(-10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(10px);
        }
      }
      
      .waiter-overlay.waiter-local {
        left: 0 !important;
      }
      
      .waiter-overlay-content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        width: auto !important;
      }
      
      .dca-logo-spin {
        display: inline-block;
        margin: auto;
        width: 3.5em;
        height: 3.5em;
        -webkit-animation: dca-spin 2s infinite linear;
        animation: dca-spin 2s infinite linear;
      }
      
      @-webkit-keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      @keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      body {
        background-color: #fff;
      }
      
      body h1,
      body h2,
      body h3,
      body h4,
      body h5,
      body span {
        font-family: "lato";
        color: #3c4a63;
      }
      
      .skin-blue .main-header .navbar {
        background: #fff;
        color: #000;
      }
      
      .skin-blue .main-header .logo {
        background: #fff !important;
        color: #000;
      }
      
      /* sidebar: collapse button hover */
      .skin-blue .main-header .navbar .sidebar-toggle {
        background: #fff;
        color: #000;
      }
      
      .skin-blue .main-header .navbar .sidebar-toggle:hover {
        background: #fff;
        color: #000;
        opacity: 0.75;
      }
      
      .skin-blue .main-header .logo {
        background: #4a5e81;
      }
      
      .skin-blue .main-header .logo:hover {
        background: #4a5e81;
      }
      
      .navbar .sidebar-toggle {
        background: #4a5e81;
        color: #fff;
      }
      
      .navbar .sidebar-toggle:hover {
        background: #4a5e81;
        color: #fff;
      }
      
      .skin-blue .main-sidebar {
        background: #3c4a63 !important;
        color: #fff;
        box-shadow: 0 0 5px #b3b3b3;
      }
      
      .skin-blue .main-sidebar .sidebar {
        padding-top: 15px;
      }
      
      .skin-blue .main-sidebar .sidebar li > a {
        border-left: unset !important;
        border-radius: 10px;
        margin: 0 14px;
        transition: background-color 100ms ease;
        color: #fff;
      }
      
      .skin-blue .main-sidebar .sidebar li > a > span {
        color: #fff !important;
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a, .skin-blue .main-sidebar .sidebar li > a:hover {
        color: #f5b33c !important;
        background: rgba(211, 213, 219, 0.2);
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a > span, .skin-blue .main-sidebar .sidebar li > a:hover > span {
        color: #f5b33c !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a {
        color: #3c4a63 !important;
        background: #f5b33c !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a > span {
        color: #3c4a63 !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active:hover > a, .skin-blue .main-sidebar .sidebar li.active > a:hover {
        background: #f5b33c !important;
        color: #3c4a63 !important;
      }
      
      .skin-blue .wrapper {
        background-color: #fff;
      }
      
      .content-wrapper,
      .right-side {
        background: #fff;
      }
      
      .content-wrapper a,
      .right-side a {
        color: #24ab9f !important;
        text-decoration: underline;
      }
      
      .content-wrapper a:hover,
      .right-side a:hover {
        text-decoration: none;
      }
      
      .dca-footer {
        background: #fff;
        color: #3c4a63;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-primary {
        border: none;
      }
      
      .box.box-solid.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #4a5e81;
      }
      
      .box.box-solid.box-primary > .box-header h3 {
        color: #fff;
      }
      
      .box.box-primary {
        border-color: #4a5e81;
      }
      
      .box.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-primary > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-accent {
        border: none;
      }
      
      .box.box-solid.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #f5b33c;
      }
      
      .box.box-solid.box-accent > .box-header h3 {
        color: #fff;
      }
      
      .box.box-accent {
        border-color: #f5b33c;
      }
      
      .box.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-accent > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-dark {
        border: none;
      }
      
      .box.box-solid.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-dark > .box-header h3 {
        color: #fff;
      }
      
      .box.box-dark {
        border-color: #000;
      }
      
      .box.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-dark > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-light {
        border: none;
      }
      
      .box.box-solid.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-light > .box-header h3 {
        color: #000;
      }
      
      .box.box-light {
        border-color: #fff;
      }
      
      .box.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-light > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-success {
        border: none;
      }
      
      .box.box-solid.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #28a745;
      }
      
      .box.box-solid.box-success > .box-header h3 {
        color: #fff;
      }
      
      .box.box-success {
        border-color: #28a745;
      }
      
      .box.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-success > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-info {
        border: none;
      }
      
      .box.box-solid.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: blue;
      }
      
      .box.box-solid.box-info > .box-header h3 {
        color: #fff;
      }
      
      .box.box-info {
        border-color: blue;
      }
      
      .box.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-info > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-warning {
        border: none;
      }
      
      .box.box-solid.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #ff9900;
      }
      
      .box.box-solid.box-warning > .box-header h3 {
        color: #fff;
      }
      
      .box.box-warning {
        border-color: #ff9900;
      }
      
      .box.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-warning > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-danger {
        border: none;
      }
      
      .box.box-solid.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #e53935;
      }
      
      .box.box-solid.box-danger > .box-header h3 {
        color: #fff;
      }
      
      .box.box-danger {
        border-color: #e53935;
      }
      
      .box.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-danger > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-white {
        border: none;
      }
      
      .box.box-solid.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-white > .box-header h3 {
        color: #000;
      }
      
      .box.box-white {
        border-color: #fff;
      }
      
      .box.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-white > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-black {
        border: none;
      }
      
      .box.box-solid.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-black > .box-header h3 {
        color: #fff;
      }
      
      .box.box-black {
        border-color: #000;
      }
      
      .box.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-black > .box-header h3 {
        color: #000;
      }
      
      .btn-default,
      .action-button {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #f5b33c;
        color: #fff;
        filter: grayscale(0%) opacity(1);
        transition: 100ms;
      }
      
      .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default:active:focus, .btn-default:visited,
      .action-button:hover,
      .action-button:focus,
      .action-button:active,
      .action-button:active:focus,
      .action-button:visited {
        background: #f5b33c;
        color: #fff;
        filter: grayscale(20%) opacity(0.7);
      }
      
      .btn-primary,
      .btn-primary:active,
      .btn-primary:visited {
        background: #4a5e81 !important;
        color: #fff !important;
      }
      
      .btn-primary:hover {
        background: #4a5e81 !important;
      }
      
      .btn-accent,
      .btn-accent:active,
      .btn-accent:visited {
        background: #f5b33c !important;
        color: #fff !important;
      }
      
      .btn-accent:hover {
        background: #f5b33c !important;
      }
      
      .btn-dark,
      .btn-dark:active,
      .btn-dark:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-dark:hover {
        background: #000 !important;
      }
      
      .btn-light,
      .btn-light:active,
      .btn-light:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-light:hover {
        background: #fff !important;
      }
      
      .btn-success,
      .btn-success:active,
      .btn-success:visited {
        background: #28a745 !important;
        color: #fff !important;
      }
      
      .btn-success:hover {
        background: #28a745 !important;
      }
      
      .btn-info,
      .btn-info:active,
      .btn-info:visited {
        background: blue !important;
        color: #fff !important;
      }
      
      .btn-info:hover {
        background: blue !important;
      }
      
      .btn-warning,
      .btn-warning:active,
      .btn-warning:visited {
        background: #ff9900 !important;
        color: #fff !important;
      }
      
      .btn-warning:hover {
        background: #ff9900 !important;
      }
      
      .btn-danger,
      .btn-danger:active,
      .btn-danger:visited {
        background: #e53935 !important;
        color: #fff !important;
      }
      
      .btn-danger:hover {
        background: #e53935 !important;
      }
      
      .btn-white,
      .btn-white:active,
      .btn-white:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-white:hover {
        background: #fff !important;
      }
      
      .btn-black,
      .btn-black:active,
      .btn-black:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-black:hover {
        background: #000 !important;
      }
      
      .waiter-overlay.waiter-local {
        background: #eaeff5 !important;
        color: #000 !important;
      }
      </style>
      
      [[2]]
      <script>
              setTimeout(function() {
                history.pushState({}, 'Data Curator', window.location.pathname);
              }, 2000);
              </script>
      

# use_dca can read rds file

    Code
      res_rds[[1]]$children
    Output
      [[1]]
      <style>@import url("https://fonts.googleapis.com/css?family=Lato:300,300italic,400,400italic,500,500italic,700,700italic");
      .dca-remove {
        display: none;
      }
      
      .dca-palette-panel .dca-palette-toggle {
        position: relative;
        display: block;
        padding: 15px;
        color: #fff;
      }
      
      .dca-palette-panel .dca-palette-toggle:hover, .dca-palette-panel .dca-palette-toggle:active, .dca-palette-panel .dca-palette-toggle:focus {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel.open > .dca-palette-toggle {
        background: rgba(0, 0, 0, 0.1);
        color: #f6f6f6;
      }
      
      .dca-palette-panel #dca-palette-menu {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: absolute;
        right: 0;
        left: auto;
        border: 1px solid #ddd;
        background: #fff;
        color: #444;
        margin-top: 0;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        box-shadow: none;
      }
      
      .dca-palette-panel #dca-palette-menu .header {
        border-bottom: 1px solid #f4f4f4;
        padding: 7px 10px;
      }
      
      .dca-palette-panel #dca-palette-menu .menu {
        padding: 10px;
      }
      
      .dca-palette-panel .shiny-input-container:not(.shiny-input-container-inline) {
        width: 192px;
        margin-bottom: 0;
      }
      
      .colourpicker-panel .colourpicker-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 4px;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer {
        border-color: #f4f4f4;
        border-radius: 50%;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer:hover {
        border-color: orange;
      }
      
      .colourpicker-panel .colourpicker-list .cp-list-col-outer .cp-list-col {
        border-radius: 50%;
      }
      
      .content-wrapper {
        position: relative;
      }
      
      .dca-footer {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
      }
      
      .dca-footer > * {
        margin-bottom: 8px;
      }
      
      .dca-footer .dca-footer-media {
        display: inline-flex;
        align-items: center;
      }
      
      .dca-footer .dca-footer-media > * {
        margin: 0 8px;
      }
      
      /* Buttons */
      .dca-shiny-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        position: relative;
        background: #27022d !important;
        color: #fff !important;
        background-image: linear-gradient(270deg, #8e9ac2, #42579a) !important;
        background-size: 400% 400% !important;
        overflow: hidden;
        animation: TransitioningBackground 10s ease infinite;
        transition: 500ms !important;
        filter: none !important;
      }
      
      .dca-shiny-btn:hover, .dca-shiny-btn:focus {
        color: #fff;
        background-image: linear-gradient(to left, #2d8fe5, #d155b8) !important;
        transform: scale(1.05);
      }
      
      .dca-shiny-btn::before {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.5);
        width: 60px;
        height: 100%;
        top: 0;
        filter: blur(30px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::after {
        content: '';
        display: block;
        position: absolute;
        background: rgba(255, 255, 255, 0.2);
        width: 30px;
        height: 100%;
        top: 0;
        filter: blur(5px) !important;
        transform: translateX(-100px) skewX(-15deg);
      }
      
      .dca-shiny-btn::before, .dca-shiny-btn::after {
        transform: translateX(300px) skewX(-15deg);
        transition: 0.7s;
      }
      
      @keyframes TransitioningBackground {
        0% {
          background-position: 1% 0%;
        }
        50% {
          background-position: 99% 100%;
        }
        100% {
          background-position: 1% 0%;
        }
      }
      
      .dca-left-btn,
      .dca-right-btn {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #fff !important;
        color: #000 !important;
        display: inline-flex !important;
        justify-content: center;
        align-items: center;
        height: 40px !important;
      }
      
      .dca-left-btn:hover, .dca-left-btn:focus,
      .dca-right-btn:hover,
      .dca-right-btn:focus {
        background: #fff;
      }
      
      .dca-left-btn .fa,
      .dca-right-btn .fa {
        margin: 1.5px;
        font-size: 20px;
      }
      
      .dca-left-btn:hover .fa {
        animation: dca-move-left 2s infinite;
      }
      
      .dca-left-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-left-btn:hover .fa:nth-child(1) {
        animation-delay: -0.4s;
      }
      
      .dca-right-btn:hover .fa {
        animation: dca-move-right 2s infinite;
      }
      
      .dca-right-btn:hover .fa:nth-child(2) {
        animation-delay: -0.2s;
      }
      
      .dca-right-btn:hover .fa:nth-child(3) {
        animation-delay: -0.4s;
      }
      
      @keyframes dca-move-left {
        0% {
          opacity: 0;
          transform: translateX(10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(-10px);
        }
      }
      
      @keyframes dca-move-right {
        0% {
          opacity: 0;
          transform: translateX(-10px);
        }
        50% {
          opacity: 1;
        }
        100% {
          opacity: 0;
          transform: translateX(10px);
        }
      }
      
      .waiter-overlay.waiter-local {
        left: 0 !important;
      }
      
      .waiter-overlay-content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        width: auto !important;
      }
      
      .dca-logo-spin {
        display: inline-block;
        margin: auto;
        width: 3.5em;
        height: 3.5em;
        -webkit-animation: dca-spin 2s infinite linear;
        animation: dca-spin 2s infinite linear;
      }
      
      @-webkit-keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      @keyframes dca-spin {
        0% {
          -moz-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -moz-transform: rotate(359deg);
          -o-transform: rotate(359deg);
          -webkit-transform: rotate(359deg);
          transform: rotate(359deg);
        }
      }
      
      body {
        background-color: red;
      }
      
      body h1,
      body h2,
      body h3,
      body h4,
      body h5,
      body span {
        font-family: "Helvetica Neue", "Helvetica", "Arial", "sans-serif";
        color: #444;
      }
      
      .skin-blue .main-header .navbar {
        background: red;
        color: #fff;
      }
      
      .skin-blue .main-header .logo {
        background: red !important;
        color: #fff;
      }
      
      /* sidebar: collapse button hover */
      .skin-blue .main-header .navbar .sidebar-toggle {
        background: red;
        color: #fff;
      }
      
      .skin-blue .main-header .navbar .sidebar-toggle:hover {
        background: red;
        color: #fff;
        opacity: 0.75;
      }
      
      .skin-blue .main-header .logo {
        background: #3c8dbc;
      }
      
      .skin-blue .main-header .logo:hover {
        background: #3c8dbc;
      }
      
      .navbar .sidebar-toggle {
        background: #3c8dbc;
        color: #fff;
      }
      
      .navbar .sidebar-toggle:hover {
        background: #3c8dbc;
        color: #fff;
      }
      
      .skin-blue .main-sidebar {
        background: #222d32 !important;
        color: #b8c7ce;
        box-shadow: 0 0 5px #b3b3b3;
      }
      
      .skin-blue .main-sidebar .sidebar {
        padding-top: 15px;
      }
      
      .skin-blue .main-sidebar .sidebar li > a {
        border-left: unset !important;
        border-radius: 10px;
        margin: 0 14px;
        transition: background-color 100ms ease;
        color: #b8c7ce;
      }
      
      .skin-blue .main-sidebar .sidebar li > a > span {
        color: #b8c7ce !important;
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a, .skin-blue .main-sidebar .sidebar li > a:hover {
        color: #fff !important;
        background: #1e282c;
      }
      
      .skin-blue .main-sidebar .sidebar li:hover > a > span, .skin-blue .main-sidebar .sidebar li > a:hover > span {
        color: #fff !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a {
        color: #fff !important;
        background: #1e282c !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active > a > span {
        color: #fff !important;
      }
      
      .skin-blue .main-sidebar .sidebar li.active:hover > a, .skin-blue .main-sidebar .sidebar li.active > a:hover {
        background: #1e282c !important;
        color: #fff !important;
      }
      
      .skin-blue .wrapper {
        background-color: #ecf0f5;
      }
      
      .content-wrapper,
      .right-side {
        background: #ecf0f5;
      }
      
      .content-wrapper a,
      .right-side a {
        color: #3c8dbc !important;
        text-decoration: underline;
      }
      
      .content-wrapper a:hover,
      .right-side a:hover {
        text-decoration: none;
      }
      
      .dca-footer {
        background: #222d32;
        color: #b8c7ce;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-primary {
        border: none;
      }
      
      .box.box-solid.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #3c8dbc;
      }
      
      .box.box-solid.box-primary > .box-header h3 {
        color: #fff;
      }
      
      .box.box-primary {
        border-color: #3c8dbc;
      }
      
      .box.box-primary > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-primary > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-accent {
        border: none;
      }
      
      .box.box-solid.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #f4f4f4;
      }
      
      .box.box-solid.box-accent > .box-header h3 {
        color: #000;
      }
      
      .box.box-accent {
        border-color: #f4f4f4;
      }
      
      .box.box-accent > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-accent > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-dark {
        border: none;
      }
      
      .box.box-solid.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-dark > .box-header h3 {
        color: #fff;
      }
      
      .box.box-dark {
        border-color: #000;
      }
      
      .box.box-dark > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-dark > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-light {
        border: none;
      }
      
      .box.box-solid.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-light > .box-header h3 {
        color: #000;
      }
      
      .box.box-light {
        border-color: #fff;
      }
      
      .box.box-light > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-light > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-success {
        border: none;
      }
      
      .box.box-solid.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #00a65a;
      }
      
      .box.box-solid.box-success > .box-header h3 {
        color: #fff;
      }
      
      .box.box-success {
        border-color: #00a65a;
      }
      
      .box.box-success > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-success > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-info {
        border: none;
      }
      
      .box.box-solid.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #00c0ef;
      }
      
      .box.box-solid.box-info > .box-header h3 {
        color: #fff;
      }
      
      .box.box-info {
        border-color: #00c0ef;
      }
      
      .box.box-info > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-info > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-warning {
        border: none;
      }
      
      .box.box-solid.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #f39c12;
      }
      
      .box.box-solid.box-warning > .box-header h3 {
        color: #fff;
      }
      
      .box.box-warning {
        border-color: #f39c12;
      }
      
      .box.box-warning > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-warning > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-danger {
        border: none;
      }
      
      .box.box-solid.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #dd4b39;
      }
      
      .box.box-solid.box-danger > .box-header h3 {
        color: #fff;
      }
      
      .box.box-danger {
        border-color: #dd4b39;
      }
      
      .box.box-danger > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-danger > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-white {
        border: none;
      }
      
      .box.box-solid.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #fff;
      }
      
      .box.box-solid.box-white > .box-header h3 {
        color: #000;
      }
      
      .box.box-white {
        border-color: #fff;
      }
      
      .box.box-white > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-white > .box-header h3 {
        color: #000;
      }
      
      .box {
        border-radius: 10px;
        box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
      }
      
      .box.box-solid.box-black {
        border: none;
      }
      
      .box.box-solid.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background: #000;
      }
      
      .box.box-solid.box-black > .box-header h3 {
        color: #fff;
      }
      
      .box.box-black {
        border-color: #000;
      }
      
      .box.box-black > .box-header {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      
      .box.box-black > .box-header h3 {
        color: #000;
      }
      
      .btn-default,
      .action-button {
        min-width: 36px;
        white-space: nowrap;
        text-decoration: none;
        text-align: center;
        line-height: 36px;
        margin: 8px 8px 8px 0;
        padding: 0 16px;
        border-radius: 4px;
        border: none;
        outline: none !important;
        cursor: pointer;
        box-shadow: 0 3px 1px -2px #0003, 0 2px 2px #00000024, 0 1px 5px #0000001f;
        background: #f4f4f4;
        color: #000;
        filter: grayscale(0%) opacity(1);
        transition: 100ms;
      }
      
      .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default:active:focus, .btn-default:visited,
      .action-button:hover,
      .action-button:focus,
      .action-button:active,
      .action-button:active:focus,
      .action-button:visited {
        background: #f4f4f4;
        color: #000;
        filter: grayscale(20%) opacity(0.7);
      }
      
      .btn-primary,
      .btn-primary:active,
      .btn-primary:visited {
        background: #3c8dbc !important;
        color: #fff !important;
      }
      
      .btn-primary:hover {
        background: #3c8dbc !important;
      }
      
      .btn-accent,
      .btn-accent:active,
      .btn-accent:visited {
        background: #f4f4f4 !important;
        color: #000 !important;
      }
      
      .btn-accent:hover {
        background: #f4f4f4 !important;
      }
      
      .btn-dark,
      .btn-dark:active,
      .btn-dark:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-dark:hover {
        background: #000 !important;
      }
      
      .btn-light,
      .btn-light:active,
      .btn-light:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-light:hover {
        background: #fff !important;
      }
      
      .btn-success,
      .btn-success:active,
      .btn-success:visited {
        background: #00a65a !important;
        color: #fff !important;
      }
      
      .btn-success:hover {
        background: #00a65a !important;
      }
      
      .btn-info,
      .btn-info:active,
      .btn-info:visited {
        background: #00c0ef !important;
        color: #fff !important;
      }
      
      .btn-info:hover {
        background: #00c0ef !important;
      }
      
      .btn-warning,
      .btn-warning:active,
      .btn-warning:visited {
        background: #f39c12 !important;
        color: #fff !important;
      }
      
      .btn-warning:hover {
        background: #f39c12 !important;
      }
      
      .btn-danger,
      .btn-danger:active,
      .btn-danger:visited {
        background: #dd4b39 !important;
        color: #fff !important;
      }
      
      .btn-danger:hover {
        background: #dd4b39 !important;
      }
      
      .btn-white,
      .btn-white:active,
      .btn-white:visited {
        background: #fff !important;
        color: #000 !important;
      }
      
      .btn-white:hover {
        background: #fff !important;
      }
      
      .btn-black,
      .btn-black:active,
      .btn-black:visited {
        background: #000 !important;
        color: #fff !important;
      }
      
      .btn-black:hover {
        background: #000 !important;
      }
      
      .waiter-overlay.waiter-local {
        background: #3c8dbc !important;
        color: #444 !important;
      }
      </style>
      
      [[2]]
      <script>
              setTimeout(function() {
                history.pushState({}, 'Data Curator', window.location.pathname);
              }, 2000);
              </script>
      

