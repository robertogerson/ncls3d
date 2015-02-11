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
    file    = "mirror.ncl",
    out     = "mirror_out.ncl",
    params  = "-m"
  },
  -- Link tests
  {
    file    = "link_set.ncl",
    out     = "link_set_out.ncl",
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

