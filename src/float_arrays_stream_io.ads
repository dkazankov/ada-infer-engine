pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Float_Arrays;
with Generic_Real_Arrays.Stream_IO;

package Float_Arrays_Stream_IO is new Float_Arrays.Stream_IO;
pragma Preelaborate (Float_Arrays_Stream_IO);
