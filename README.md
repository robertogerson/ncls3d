# ncls3d (NCL Stereocopic 3D Converter)

*ncls3d* is a lua script to convert an NCL application to its stereoscopic
counterpart.  The final application is ready to be shown on stereoscopic 3D
displays.  It allows both off-line conversion, and on-line (client-side)
conversion---through an NCLua media object.

The following image shows an overview of the process that nclsc implements:

![ncls3d Overview](http://www.telemidia.puc-rio.br/~robertogerson/ncls3d_overview.png)

## Dependencies
The easiest way to get the nclsc dependencies is running:

```bash
./get_deps.lua
```
The dependencies will be downloaded and will be available at `deps` directory.

## Usage
### Off-line
The off-line option allows you to generate the stereoscopic application at the
server-side. In order to do so, you should run nclsc.lua from the command-line
with something like:

```bash
./nclsc.lua [-o <output>] <input>
```

This will take <input> as an NCL input file and generates a new NCL application
at the <output> file. A complete list of nclsc.lua parameters is accessible
through:

```bash
./ncls3d.lua -h
```

### NCLua
We also provide an nclcs.nclua file that allows you to embedded the nclsc
program in an NCLua application. In such a case you should add an NCLua 
`<media>` element in the

```xml
...
<media id="tos3d" src="nclsc.nclua">
  <property name="url" value="original-2d_ncl_app.ncl"/>
</media>
...
```
When the above `tos3d` media object receives a start action (triggered by the
wrapper application), the conversion process generates the stereoscopic
application on the client-side and adds it to the wrapper NCL application,
presenting it to the viewer.

## Credits
nclsc is mainly developed by:

  * Roberto Azevedo <robertogerson@telemidia.puc-rio.br>

----
Copyright (c) 2015 Roberto Azevedo

This file is part of nclsc.

nclsc is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

nclsc is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with nclsc. If not, see <http://www.gnu.org/licenses/>.
