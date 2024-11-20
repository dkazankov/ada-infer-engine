pragma Ada_95;
pragma Profile (Ravenscar);

with Generic_Real_Arrays;

package Float_Arrays is new Generic_Real_Arrays (Real => Float);
pragma Pure (Float_Arrays);
pragma Remote_Types (Float_Arrays);
