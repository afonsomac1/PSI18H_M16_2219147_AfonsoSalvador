-- MySQL Script generated by MySQL Workbench
-- Thu May 21 00:00:56 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PSI18_AfonsoSalvador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PSI18_AfonsoSalvador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PSI18_AfonsoSalvador` DEFAULT CHARACTER SET utf8 ;
USE `PSI18_AfonsoSalvador` ;

-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(15) NOT NULL,
  `imagem` LONGBLOB NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Login` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(8) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `foto` LONGBLOB NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`id_user`, `Pais_idPais`),
  INDEX `fk_Login_Pais1_idx` (`Pais_idPais` ASC),
  CONSTRAINT `fk_Login_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `PSI18_AfonsoSalvador`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Categorias` (
  `id_Categoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Organizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Organizacao` (
  `idOrganizacao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `responsavel_vol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrganizacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Voluntariado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Voluntariado` (
  `idVoluntariado` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(650) NOT NULL,
  `Categorias_id_Categoria` INT NOT NULL,
  `Organizacao_idOrganizacao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `imagem` LONGBLOB NULL,
  PRIMARY KEY (`idVoluntariado`, `Categorias_id_Categoria`, `Organizacao_idOrganizacao`),
  INDEX `fk_Voluntariado_Categorias1_idx` (`Categorias_id_Categoria` ASC),
  INDEX `fk_Voluntariado_Organizacao1_idx` (`Organizacao_idOrganizacao` ASC),
  CONSTRAINT `fk_Voluntariado_Categorias1`
    FOREIGN KEY (`Categorias_id_Categoria`)
    REFERENCES `PSI18_AfonsoSalvador`.`Categorias` (`id_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voluntariado_Organizacao1`
    FOREIGN KEY (`Organizacao_idOrganizacao`)
    REFERENCES `PSI18_AfonsoSalvador`.`Organizacao` (`idOrganizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Publicar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Publicar` (
  `idPublicar` INT NOT NULL AUTO_INCREMENT,
  `publicacao` VARCHAR(280) NULL,
  `Login_id_user` INT NOT NULL,
  `Login_Pais_idPais` INT NOT NULL,
  `Voluntariado_idVoluntariado` INT NOT NULL,
  `Voluntariado_Categorias_id_Categoria` INT NOT NULL,
  `Voluntariado_Organizacao_idOrganizacao` INT NOT NULL,
  PRIMARY KEY (`idPublicar`, `Login_id_user`, `Login_Pais_idPais`, `Voluntariado_idVoluntariado`, `Voluntariado_Categorias_id_Categoria`, `Voluntariado_Organizacao_idOrganizacao`),
  INDEX `fk_Publicar_Login1_idx` (`Login_id_user` ASC, `Login_Pais_idPais` ASC),
  INDEX `fk_Publicar_Voluntariado1_idx` (`Voluntariado_idVoluntariado` ASC, `Voluntariado_Categorias_id_Categoria` ASC, `Voluntariado_Organizacao_idOrganizacao` ASC),
  CONSTRAINT `fk_Publicar_Login1`
    FOREIGN KEY (`Login_id_user` , `Login_Pais_idPais`)
    REFERENCES `PSI18_AfonsoSalvador`.`Login` (`id_user` , `Pais_idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicar_Voluntariado1`
    FOREIGN KEY (`Voluntariado_idVoluntariado` , `Voluntariado_Categorias_id_Categoria` , `Voluntariado_Organizacao_idOrganizacao`)
    REFERENCES `PSI18_AfonsoSalvador`.`Voluntariado` (`idVoluntariado` , `Categorias_id_Categoria` , `Organizacao_idOrganizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Detalhes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Detalhes` (
  `idDetalhes` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `duracao` VARCHAR(10) NOT NULL,
  `alojamento` VARCHAR(75) NOT NULL,
  `alimentacao` VARCHAR(75) NOT NULL,
  `transfers` VARCHAR(75) NOT NULL,
  `seguro` VARCHAR(75) NOT NULL,
  `acompanhamento` VARCHAR(80) NULL,
  `adicional` VARCHAR(100) NULL,
  `localidade` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idDetalhes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `tipo_experiencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Requisitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Requisitos` (
  `idRequisitos` INT NOT NULL AUTO_INCREMENT,
  `Idade` VARCHAR(45) NOT NULL,
  `Lingua` VARCHAR(45) NOT NULL,
  `escolaridade` VARCHAR(45) NOT NULL,
  `Detalhes_idDetalhes` INT NOT NULL,
  `Experiencia_idExperiencia` INT NOT NULL,
  PRIMARY KEY (`idRequisitos`, `Detalhes_idDetalhes`, `Experiencia_idExperiencia`),
  INDEX `fk_Requisitos_Detalhes1_idx` (`Detalhes_idDetalhes` ASC),
  INDEX `fk_Requisitos_Experiencia1_idx` (`Experiencia_idExperiencia` ASC),
  CONSTRAINT `fk_Requisitos_Detalhes1`
    FOREIGN KEY (`Detalhes_idDetalhes`)
    REFERENCES `PSI18_AfonsoSalvador`.`Detalhes` (`idDetalhes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisitos_Experiencia1`
    FOREIGN KEY (`Experiencia_idExperiencia`)
    REFERENCES `PSI18_AfonsoSalvador`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSI18_AfonsoSalvador`.`Organizacao_has_Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSI18_AfonsoSalvador`.`Organizacao_has_Pais` (
  `Organizacao_idOrganizacao` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`Organizacao_idOrganizacao`, `Pais_idPais`),
  INDEX `fk_Organizacao_has_Pais_Pais1_idx` (`Pais_idPais` ASC),
  INDEX `fk_Organizacao_has_Pais_Organizacao1_idx` (`Organizacao_idOrganizacao` ASC),
  CONSTRAINT `fk_Organizacao_has_Pais_Organizacao1`
    FOREIGN KEY (`Organizacao_idOrganizacao`)
    REFERENCES `PSI18_AfonsoSalvador`.`Organizacao` (`idOrganizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organizacao_has_Pais_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `PSI18_AfonsoSalvador`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
