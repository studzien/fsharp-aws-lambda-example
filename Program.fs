namespace FSharpLambdaFunction

open System
open System.IO

module LambdaHandler =
    let myHandler (inputStream : Stream) =
        let outputStream = new MemoryStream()
        let writer = new StreamWriter(outputStream)
        writer.Write "Hello World from F#!\n"
        writer.Flush ()
        outputStream.Position <- int64 0
        outputStream 
