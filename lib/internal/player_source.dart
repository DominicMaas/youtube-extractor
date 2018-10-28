class PlayerSource {
  List<ICipherOperation> cipherOperations;

   PlayerSource(this.cipherOperations);

   String decipher(String input) {
     cipherOperations.forEach((operation) {
       input = operation.decipher(input);
     });

     return input;
   }
}