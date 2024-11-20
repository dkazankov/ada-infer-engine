pragma Ada_95;
pragma Profile (Ravenscar);

with Generic_Real_Arrays;

package Long_Float_Arrays is new Generic_Real_Arrays (Real => Long_Float);
pragma Pure (Long_Float_Arrays);
pragma Remote_Types (Long_Float_Arrays);
