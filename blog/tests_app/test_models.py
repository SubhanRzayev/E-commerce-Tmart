
# from django.test import TestCase
# from blog.models import Category



# class CategoryModelTest(TestCase):


#     @classmethod
#     def setUpClass(cls):
#         cls.data = {
#             'category':"T-shirt"
#         }

#         cls.data2 = {
#             'category':"Bags"
#         }
#         Category.objects.create(**cls.data)
#         Category.objects.create(**cls.data2)
        
#         cls.category_info1= Category.objects.first()
#         cls.category_info2= Category.objects.last()


#     def test_created_data(self):
#         self.assertEqual(self.category_info1.category, self.data['category'])
#         self.assertEqual(self.category_info2.category, self.data2['category'])

        
    def test_str_method(self):
        self.assertEqual(str(self.category_info1), self.data['category'])


#     @classmethod
#     def tearDownClass(cls):
#         print('tearDownClass')