pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Long_Float_Arrays;
with Generic_Real_Arrays.Stream_IO;

package Long_Float_Arrays_Stream_IO is new Long_Float_Arrays.Stream_IO;
pragma Preelaborate (Long_Float_Arrays_Stream_IO);
