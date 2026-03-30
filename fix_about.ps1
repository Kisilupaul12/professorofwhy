$html = Get-Content "about.html" -Raw -Encoding UTF8
$pattern = '(?si)<section class="code-sec" id="code">.*?</section>'
$replacement = @"
  <section class="code-sec" id="code">
    <div class="wrap">
      <div class="code-hdr">
        <span class="tag rv" style="justify-content:center;margin:0 auto 1rem">Leadership Framework</span>
        <h2 class="rv d1">The <em>WHY CODE</em></h2>
        <p class="rv d2">A purpose-driven leadership framework that begins with the most important question every leader must answer &mdash; WHY &mdash; and unlocks four transformational pillars that turn purpose into lasting influence.</p>
      </div>
      <div class="code-grid five">
        
        <div class="flip-card rv">
          <div class="flip-card-inner">
            <div class="flip-card-front cc">
              <div class="cc-ghost">W</div>
              <div class="cc-box">WHY</div><span class="cc-word">Purpose</span>
              <div class="cc-title" style="margin-top:20px; font-size:1.8rem;">The WHY</div>
            </div>
            <div class="flip-card-back cc">
              <p class="cc-desc">Clarity of purpose &mdash; the reason behind decisions and the belief to do what matters the most. When the WHY is clear, the HOW becomes inevitable.</p>
              <div class="cc-out" style="margin-top:auto;">Outcome: Leaders gain unshakable clarity that drives every decision.</div>
            </div>
          </div>
        </div>
        
        <div class="flip-card rv d1">
          <div class="flip-card-inner">
            <div class="flip-card-front cc">
              <div class="cc-ghost">C</div>
              <div class="cc-box">C</div><span class="cc-word">Communication</span>
              <div class="cc-title" style="margin-top:20px; font-size:1.8rem;">Communication Skills</div>
            </div>
            <div class="flip-card-back cc">
              <p class="cc-desc">Explaining the complex vision in a way that inspires action while picking up a strategy that helps you execute.</p>
              <div class="cc-out" style="margin-top:auto;">Outcome: Leaders articulate vision with precision that moves people.</div>
            </div>
          </div>
        </div>

        <div class="flip-card rv d2">
          <div class="flip-card-inner">
            <div class="flip-card-front cc">
              <div class="cc-ghost">O</div>
              <div class="cc-box">O</div><span class="cc-word">Branding</span>
              <div class="cc-title" style="margin-top:20px; font-size:1.8rem;">Personal Branding</div>
            </div>
            <div class="flip-card-back cc">
              <p class="cc-desc">A personal brand that gets you opportunities for your growth and scaling of the institution, on and offline.</p>
              <div class="cc-out" style="margin-top:auto;">Outcome: Leaders become magnets for opportunity through positioning.</div>
            </div>
          </div>
        </div>

        <div class="flip-card rv d3">
          <div class="flip-card-inner">
            <div class="flip-card-front cc">
              <div class="cc-ghost">D</div>
              <div class="cc-box">D</div><span class="cc-word">Development</span>
              <div class="cc-title" style="margin-top:20px; font-size:1.8rem;">Leadership Development</div>
            </div>
            <div class="flip-card-back cc">
              <p class="cc-desc">From leading yourself to leading teams. Building capacity from the inside out to multiply your influence at every level.</p>
              <div class="cc-out" style="margin-top:auto;">Outcome: Leaders multiply their impact by developing other leaders.</div>
            </div>
          </div>
        </div>

        <div class="flip-card rv d4">
          <div class="flip-card-inner">
            <div class="flip-card-front cc">
              <div class="cc-ghost">E</div>
              <div class="cc-box">E</div><span class="cc-word">Networking</span>
              <div class="cc-title" style="margin-top:20px; font-size:1.8rem;">Strategic Networking</div>
            </div>
            <div class="flip-card-back cc">
              <p class="cc-desc">Meaningful relationships birth strategic networks. It&rsquo;s about being known for the right reasons by people who own opportunities.</p>
              <div class="cc-out" style="margin-top:auto;">Outcome: Leaders build powerful networks that open new frontiers.</div>
            </div>
          </div>
        </div>

      </div>
      <div class="code-q rv">
        <blockquote>&ldquo;WHY is not a question. It is a <em>destination.</em> The CODE is the map.&rdquo;</blockquote>
        <cite>&mdash; Nzioki Erik, The Professor of Why&trade;</cite>
      </div>
    </div>
  </section>
"@
$html = $html -replace $pattern, $replacement
[IO.File]::WriteAllText("about.html", $html, [Text.Encoding]::UTF8)
Write-Host "Fixed about.html"
