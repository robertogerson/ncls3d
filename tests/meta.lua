test_suite = {
  -- Region tests
  {
    file = "region.ncl",
    out = "region_out.ncl",
    params = ""
  },
  -- Media tests
  {
    file="media.ncl",
    out="media_out.ncl",
    params="-m -d"
  },
  {
    file="media_without_left.ncl",
    out="media_without_left_out.ncl",
    params="-m -d"
  },
  {
    file="media_without_width.ncl",
    out="media_without_width_out.ncl",
    params="-m -d"
  },
  {
    file="mirror.ncl",
    out="mirror_out.ncl",
    params="-m"
  },
  -- Link tests
  {
    file="mirror.ncl",
    out="mirror_out.ncl",
    params="-m"
  },

}

