# from django.http import response
# from django.test import TestCase
# from django.urls import reverse_lazy
# from blog.views import blog_detail

# class BlogDetailViewTest(TestCase):


#     @classmethod
#     def setUpClass(cls):
#         cls.url = reverse_lazy("blog:blog_detail")
#         cls.valid_data = {
#             "name":"Subhan",
#             "email":"subhanrzayev97@gmail.com",
#             "message":"Write his comment"
#         }

#         cls.invalid_data = {
#             "name":"Subhan",
#             "email":"subhan",
#             "message":"Write his comment"
#         }
        

#     def test_url(self):
#         blog_detail_url = '/blog-detail/<slug:slug>/'
#         self.assertEqual(self.url,blog_detail_url)  

#     def test_get_request(self):
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code,200)
#         self.assertIn('form',response.context)
#         self.assertTemplateUsed(response,'blog-detail.html')

#     @classmethod
#     def tearDownClass(cls):
#         pass