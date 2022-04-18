// final PostRepository _postWebClient = PostRepository();
// final UserRepository _userWebClient = UserRepository();

// TESTES API
// GET
// _postWebClient.findAllPosts().then((get) => print('GET MAIN: $get'));
// GET by ID
// _postWebClient
//    .findPostByID(1)
//    .then((getByID) => print('GET by ID MAIN: $getByID'));
// POST
//_postWebClient
//    .savePost(Post(1, 101, "foo", "bar"))
//    .then((save) => print('POST MAIN: $save'));
// PUT
//_postWebClient
//    .updateTitle(1, 'Amor')
//    .then((update) => print('PUT MAIN: $update'));
// DELETE
//_postWebClient
//  .deletePost(1)
//   .then((delete) => print('DELETE MAIN: ${delete.statusCode}'));
// _userWebClient
//     .saveUser(User(
//         11,
//         'Hilton Santos',
//         'Apelido',
//         'hilton@email.com',
//         Address('Rua', 'Suite', 'Cidade', 'Zipcode', Geo('lat', 'lng')),
//         '98766',
//         'hilton.com',
//         Company('Nome', 'Frase', 'Ramo')))
//     .then((save) => print('USER MAIN: ${save.name}'));