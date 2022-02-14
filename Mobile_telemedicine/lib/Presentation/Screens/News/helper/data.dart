import 'package:TELEMEDICINEAPP/Models/news/categoriesModel.dart';

List<CategorieModel> getCategories() {
  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2016/02/19/11/19/office-1209640_1280.jpg";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2017/06/30/00/47/amusement-2456905_1280.jpg";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2017/08/04/21/52/earth-2581631_1280.jpg";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2015/07/30/14/36/hypertension-867855_1280.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2017/02/01/13/53/analysis-2030265_1280.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2016/07/13/16/00/box-1514845_1280.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl =
      "https://cdn.pixabay.com/photo/2017/04/23/19/30/earth-2254769_1280.jpg";
  myCategories.add(categorieModel);

  return myCategories;
}
