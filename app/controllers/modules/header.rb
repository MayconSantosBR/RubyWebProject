module HeaderGenerator
    def generate_header
      header = <<~HTML
        <div class="header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" onclick="goTo('homepage/index.html')">S.O.S Civil</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <div class="nav-item dropdown show">
                        <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="registers">Cadastros</a>
            
                        <div class="dropdown-menu" aria-labelledby="registers">
                            <a class="dropdown-item" onclick="goTo('people/index.html')">Pessoas</a>
                            <a class="dropdown-item">Estabelecimentos</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown show">
                        <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="lists">Registros</a>
            
                        <div class="dropdown-menu" aria-labelledby="lists">
                            <a class="dropdown-item" onclick="goTo('people/list.html')">Pessoas</a>
                            <a class="dropdown-item">Estabelecimentos</a>
                        </div>
                    </div>
                </ul>
            </div>
        </nav>
        </div>
    
        <script>
        function goTo(newUrl) {
            window.location.href = "http://localhost:3000/" + newUrl;
        }
        </script>
      HTML
  
      return header
    end
  end