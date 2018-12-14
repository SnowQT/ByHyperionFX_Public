
-- return cfg

local cfg = {}

cfg.firstjob = "Civil" -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
@font-face {
  font-family: 'hyperion';
  src: url('https://byhyperion.net/stylesheet/fonts/american_captain.ttf');
}
.div_job{
  position: absolute;
  top: 30px;
  left: 40px;
  letter-spacing: 1.5px;
  font-size: 29px;
  font-weight: bold;
  color: white;
  text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
  font-family: "hyperion";
}
]]

-- icon display css
cfg.icon_display_css = [[
.div_job_icon{
  position: absolute;
  height: 33px;
  width: 33px;
  bottom: 2px;
  left: 304px;
}
]]

-- list of ["group"] => css for icons
cfg.group_icons = {
  ["Betjent"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/betjent.png);
    }
  ]],
  ["Elev"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/betjent.png);
    }
  ]],
  ["AKS"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/aks.png);
    }
  ]],
  ["Ambulanceredder"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/ambulanceredder.png);
    }
  ]],
  ["Mekaniker"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/mekaniker.png);
    }
  ]],
  ["Taxa"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/taxa.png);
    }
  ]],
  ["Træhugger"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/traehugger.png);
    }
  ]],
  ["Advokat"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/advokat.png);
    }
  ]],
  ["Dommer"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/dommer.png);
    }
  ]],
  ["Civil"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/civil.png);
    }
  ]],
  ["Udbringer"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/udbringer.png);
    }
  ]],
  ["Postbud"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/postbud.png);
    }
  ]],
  ["Skraldemand"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/skraldemand.png);
    }
  ]],
  ["Lastbilchauffør"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/lastbilchauffor.png);
    }
  ]],
  ["Pengetransport"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/pengetransporter.png);
    }
  ]],
  ["Minearbejder"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/minearbejder.png);
    }
  ]],
  ["PET-agent"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/civil.png);
    }
  ]],
  ["Psykolog"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/psych.png);
    }
  ]],
  ["Fisker"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/fisker.png);
    }
  ]],
  ["Journalist"] = [[
    .div_job_icon{
      content: url(http://second.terstedmikkelsen.dk/hyp/jobs/newspaper.png);
    }
  ]], -- this is an example, add more under it using the same model, leave the } at the end.
}
return cfg