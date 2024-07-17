<footer class="footer px-4">
        <div><a href="https://github.com/peachk3/Styleboso">Styleboso</a> © 2024 Gaebar2zo.</div>
        <div class="ms-auto">Powered by&nbsp;<a href="https://www.itwillbs.co.kr/">ITWILLBS</a> Class7</div>
      </footer>
    </div>
    <!-- CoreUI and necessary plugins-->
    <script src="/resources/vendors/@coreui/coreui-pro/js/coreui.bundle.min.js"></script>
    <script src="/resources/vendors/simplebar/js/simplebar.min.js"></script>
    <script src="/resources/vendors/i18next/js/i18next.min.js"></script>
    <script src="/resources/vendors/i18next-http-backend/js/i18nextHttpBackend.js"></script>
    <script src="/resources/vendors/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.js"></script>
    <script src="/resources/js/i18next.js"></script>
    <script>
      const header = document.querySelector('header.header');

      document.addEventListener('scroll', () => {
        if (header) {
          header.classList.toggle('shadow-sm', document.documentElement.scrollTop > 0);
        }
      });
    </script>
    <!-- Plugins and scripts required by this view-->
    <script src="/resources/vendors/chart.js/js/chart.umd.js"></script>
    <script src="/resources/vendors/@coreui/chartjs/js/coreui-chartjs.js"></script>
    <script src="/resources/vendors/@coreui/utils/js/index.js"></script>
    <script src="/resources/js/main.js"></script>
    <script>
    </script>