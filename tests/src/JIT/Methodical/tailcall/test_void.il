// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly extern mscorlib { }
.assembly test_void { }
.namespace JitTest
{
  .class private auto ansi beforefieldinit Test extends [mscorlib]System.Object
  {
    .field private static int32 m
    .field private static int32 n
    .method private hidebysig static void Main() il managed
    {
      .entrypoint
      .maxstack  4
      .locals (int32 V_0)
      ldsfld     int32 JitTest.Test::n
      ldc.i4.1
      bne.un.s   IL_0047

      ldsfld     int32 JitTest.Test::m
      ldc.i4     0x375f00
      bne.un.s   IL_0029

      ldstr      "PASSED: 10! == 3628800"
      call       void [System.Console]System.Console::WriteLine(class System.String)
      ldc.i4.s   100
      call       void [system.runtime.extensions]System.Environment::Exit(int32)
      ret

IL_0029:
      ldstr      "FAILED: 10! != "
      ldsflda    int32 JitTest.Test::m
      call       instance class System.String [mscorlib]System.Int32::ToString()
      call       class System.String [mscorlib]System.String::Concat(class System.String, class System.String)
      call       void [System.Console]System.Console::WriteLine(class System.String)
      ldc.i4.s   101
      call       void [system.runtime.extensions]System.Environment::Exit(int32)
      ret

IL_0047:
      ldsfld     int32 JitTest.Test::m
      ldsfld     int32 JitTest.Test::n
      dup
      ldc.i4.1
      sub
      stsfld     int32 JitTest.Test::n
      mul
      stsfld     int32 JitTest.Test::m
      tail. call void JitTest.Test::Main()
      ret
    } 

    .method private hidebysig  specialname rtspecialname static 
            void .cctor() il managed
    {
      .maxstack  8
      IL_0000:  ldc.i4.1
      IL_0001:  stsfld     int32 JitTest.Test::m
      IL_0006:  ldc.i4.s   10
      IL_0008:  stsfld     int32 JitTest.Test::n
      IL_000d:  ret
    } 

    .method public hidebysig  specialname rtspecialname 
            instance void .ctor() il managed
    {
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } 

  } 

} 
