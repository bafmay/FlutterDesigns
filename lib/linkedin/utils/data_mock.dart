import 'package:flutter_design/linkedin/models/new_post.dart';
import 'package:flutter_design/linkedin/models/post.dart';
import 'package:flutter_design/linkedin/models/user.dart';

const itemsNavBar = [
  'assets/linkedin/icons/home.svg',
  'assets/linkedin/icons/users.svg',
  'assets/linkedin/icons/add.svg',
  'assets/linkedin/icons/job.svg',
  'assets/linkedin/icons/bell.svg',
];

final newPostItems = <NewPost>[
  NewPost(name: 'Image', path: 'assets/linkedin/icons/image.svg'),
  NewPost(name: 'Video', path: 'assets/linkedin/icons/film.svg'),
  NewPost(name: 'File', path: 'assets/linkedin/icons/file.svg'),
  NewPost(name: 'Article', path: 'assets/linkedin/icons/article.svg')
];

final posts = [
  Post(
    user: User(
        name: 'Diego Velasquez',
        photo: 'assets/linkedin/images/users/diego.jpg'),
    isLikeMe: true,
    like: 350,
    description: "Finally my 'Work From Home' @Android arrived 😺.",
    title: 'Work From Home.',
    timeAgo: '3 days ago',
    comment: 480,
    photo: 'assets/linkedin/images/posts/post_diego.jpg',
  ),
  Post(
    user: User(
        name: 'Brangy Castro',
        photo: 'assets/linkedin/images/users/brangy.jpg'),
    isLikeMe: true,
    like: 48,
    timeAgo: '10 days ago',
    comment: 600,
    title: 'Security Informatic.',
    photo: 'assets/linkedin/images/posts/brangy_post.jpg',
    description:
        'Computer security, also known as cybersecurity or information technology security, is the area related to computer science and telematics that focuses on the protection of',
  ),
  Post(
      user: User(
          name: 'Javier Velez',
          photo: 'assets/linkedin/images/users/javier.jpg'),
      like: 85,
      photo: 'assets/linkedin/images/posts/javier_post.jpg',
      comment: 200,
      timeAgo: '22 days ago',
      title: 'Learning NodeJS,',
      description:
          'Node.js is an open source, cross-platform runtime environment for the server layer based on the JavaScript programming language, asynchronous, with data I/O in an event-driven architecture and based on the V8 engine of Google'),
  Post(
      user: User(
          name: 'Mauricio Lopez',
          photo: 'assets/linkedin/images/users/mao.jpg'),
      like: 130,
      photo: 'assets/linkedin/images/posts/mao_post.jpg',
      comment: 350,
      timeAgo: '3 week ago',
      title: 'Creating logo',
      description:
          'Simply enter some details about your business and select your design preferences, and the logo generator will create the perfect logo for your brand.'),
];

final user = User(
    name: 'Brian Alvis',
    photo: 'assets/linkedin/images/users/user.png',
    location: 'Lima, Peru',
    conections: 990,
    profile: 550,
    ocupation: 'Android Developer',
    activity: [
      Activity(
        name: 'About',
        description:
            'Hello, I am Rohan kurniawan, a founder at Doloris based at Cilegon, Batnen.',
      ),
      Activity(
        name: 'Activity',
        title: "Gokek's New Transport Desing",
        description: 'Anda mengomentari ini',
        date: '1 minutes ago',
        image: 'assets/linkedin/images/activity.png',
      ),
      Activity(
        name: 'Experience',
        title: "Founder at Dolaris",
        description: '10 September, 2020',
        date: 'Cilegon Banten, Indonesia',
        image: 'assets/linkedin/images/experience.png',
      ),
      Activity(
        name: 'Education',
        description: "Fakultas Teknik Untirta",
        title: 'Universitas Pelita Harapan',
        date: '2015-2020',
        image: 'assets/linkedin/images/education.png',
      ),
      Activity(
        name: 'Activity',
        title: "Gokek's New Transport Desing",
        description: 'Anda mengomentari ini',
        date: '1 minutes ago',
        image: 'assets/linkedin/images/activity.png',
      ),
      Activity(
        name: 'Experience',
        title: "Founder at Dolaris",
        description: '10 September, 2020',
        date: 'Cilegon Banten, Indonesia',
        image: 'assets/linkedin/images/experience.png',
      )
    ]);
