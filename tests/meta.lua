test_suite = {
  -- Region tests
  {
    file    = "region.ncl",
    out     = "region_out.ncl",
    params  = ""
  },
  {
    file    = "media_region.ncl",
    out     = "media_region_out.ncl",
    params  = "-m"
  },
  -- Media tests
  {
    file    = "media_prop.ncl",
    out     = "media_prop_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_prop_without_left.ncl",
    out     = "media_prop_without_left_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_prop_without_width.ncl",
    out     = "media_prop_without_width_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_multi.ncl",
    out     = "media_multi_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_video.ncl",
    out     = "media_video_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_nclua.ncl",
    out     = "media_nclua_out.ncl",
    params  = "-m"
  },
  {
    file    = "media_html.ncl",
    out     = "media_html_out.ncl",
    params  = "-m"
  },

  -- Link tests
  {
    file    = "link_set_bounds.ncl",
    out     = "link_set_bounds_out.ncl",
    params  = "-m -d"
  },
  {
    file    = "link_set_depth.ncl",
    out     = "link_set_depth_out.ncl",
    params  = "-m -d"
  },
  -- Transition
  {
    file    = "transition.ncl",
    out     = "transition_out.ncl",
    params  = "-m"
  }
  -- \todo Animations
}

